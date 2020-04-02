/*
 * Copyright (C) 2018 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define LOG_TAG "android.hardware.power@1.3-service.lavender-libperfmgr"

#include <android-base/file.h>
#include <android-base/logging.h>
#include <android-base/properties.h>
#include <android-base/strings.h>
#include <utils/Log.h>

#include "Power.h"

#include "power-helper.h"

extern struct stat_pair rpm_stat_map[];

namespace android {
namespace hardware {
namespace power {
namespace V1_3 {
namespace implementation {

using ::android::hardware::power::V1_0::Feature;
using ::android::hardware::power::V1_0::PowerStatePlatformSleepState;
using ::android::hardware::power::V1_0::Status;
using ::android::hardware::power::V1_1::PowerStateSubsystem;
using ::android::hardware::hidl_vec;
using ::android::hardware::Return;
using ::android::hardware::Void;

Power::Power() :
        mHintManager(nullptr),
        mInteractionHandler(nullptr),
        mSustainedPerfModeOn(false),
        mReady(false) {

    mInitThread =
            std::thread([this](){
                            android::base::WaitForProperty(kPowerHalInitProp, "1");
                            mHintManager = HintManager::GetFromJSON("/vendor/etc/powerhint.json");
                            mInteractionHandler = std::make_unique<InteractionHandler>(mHintManager);
                            mInteractionHandler->Init();
                            // Now start to take powerhint
                            mReady.store(true);
                        });
    mInitThread.detach();
}

// Methods from ::android::hardware::power::V1_0::IPower follow.
Return<void> Power::setInteractive(bool /* interactive */)  {
    return Void();
}

Return<void> Power::powerHint(PowerHint_1_0 hint, int32_t data) {
    if (!isSupportedGovernor() || !mReady) {
        return Void();
    }

    switch(hint) {
        case PowerHint_1_0::INTERACTION:
            if (mSustainedPerfModeOn) {
                break;
            }

            mInteractionHandler->Acquire(data);
            break;
        case PowerHint_1_0::SUSTAINED_PERFORMANCE:
            if (data && mSustainedPerfModeOn) {
                break;
            }

            if (data) {
                ALOGD("SUSTAINED_PERFORMANCE ON");
                mHintManager->DoHint("SUSTAINED_PERFORMANCE");
                mSustainedPerfModeOn = true;
            } else {
                ALOGD("SUSTAINED_PERFORMANCE OFF");
                mHintManager->EndHint("SUSTAINED_PERFORMANCE");
                mSustainedPerfModeOn = false;
            }
            break;
        case PowerHint_1_0::LAUNCH:
            if (mSustainedPerfModeOn) {
                break;
            }

            if (data) {
                mHintManager->DoHint("LAUNCH");
                ALOGD("LAUNCH ON");
            } else {
                mHintManager->EndHint("LAUNCH");
                ALOGD("LAUNCH OFF");
            }
            break;
        default:
            break;

    }

    return Void();
}

Return<void> Power::setFeature(Feature feature, bool activate)  {
    set_feature(static_cast<feature_t>(feature), activate ? 1 : 0);
    return Void();
}

Return<void> Power::getPlatformLowPowerStats(getPlatformLowPowerStats_cb _hidl_cb) {

    hidl_vec<PowerStatePlatformSleepState> states;
    states.resize(0);

    _hidl_cb(states, Status::SUCCESS);
    return Void();
}

Return<void> Power::getSubsystemLowPowerStats(getSubsystemLowPowerStats_cb _hidl_cb) {

    hidl_vec<PowerStateSubsystem> subsystems;

    _hidl_cb(subsystems, Status::SUCCESS);
    return Void();
}

bool Power::isSupportedGovernor() {
    std::string buf;
    if (android::base::ReadFileToString("/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor", &buf)) {
        buf = android::base::Trim(buf);
    }

    if (buf != "schedutil" && buf != "sched") {
        ALOGE("Governor not supported");
        return false;
    }

    return true;
}

Return<void> Power::powerHintAsync(PowerHint_1_0 hint, int32_t data) {
    return powerHint(hint, data);
}

// Methods from ::android::hardware::power::V1_2::IPower follow.
Return<void> Power::powerHintAsync_1_2(PowerHint_1_2 hint, int32_t data) {
    if (!isSupportedGovernor() || !mReady) {
        return Void();
    }

    switch(hint) {
        case PowerHint_1_2::AUDIO_LOW_LATENCY:
            if (data) {
                mHintManager->DoHint("AUDIO_LOW_LATENCY");
                ALOGD("AUDIO LOW LATENCY ON");
            } else {
                mHintManager->EndHint("AUDIO_LOW_LATENCY");
                ALOGD("AUDIO LOW LATENCY OFF");
            }
            break;
        case PowerHint_1_2::AUDIO_STREAMING:
            if (!mSustainedPerfModeOn) {
                if (data) {
                    mHintManager->DoHint("AUDIO_STREAMING");
                    ALOGD("AUDIO STREAMING ON");
                } else {
                    mHintManager->EndHint("AUDIO_STREAMING");
                    ALOGD("AUDIO STREAMING OFF");
                }
            }
            break;
        default:
            return powerHint(static_cast<PowerHint_1_0>(hint), data);
    }
    return Void();
}

// Methods from ::android::hardware::power::V1_3::IPower follow.
Return<void> Power::powerHintAsync_1_3(PowerHint_1_3 hint, int32_t data) {
    if (!isSupportedGovernor() || !mReady) {
        return Void();
    }

    if (hint == PowerHint_1_3::EXPENSIVE_RENDERING) {
        if (mSustainedPerfModeOn) {
            return Void();
        }

        if (data > 0) {
            mHintManager->DoHint("EXPENSIVE_RENDERING");
        } else {
            mHintManager->EndHint("EXPENSIVE_RENDERING");
        }
    } else {
        return powerHintAsync_1_2(static_cast<PowerHint_1_2>(hint), data);
    }

    return Void();
}
}  // namespace implementation
}  // namespace V1_3
}  // namespace power
}  // namespace hardware
}  // namespace android
