# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    af.fast_track_multiplier=1 \
    audio.deep_buffer.media=true \
    audio.sys.offload.pstimeout.secs=3 \
    audio.offload.min.duration.secs=30 \
    audio.offload.video=true \
    audio.sys.noisy.broadcast.delay=600 \
    vendor.audio.volume.headset.gain.depcal=true \
    persist.vendor.audio.hifi.int_codec=true \
    persist.vendor.audio.hw.binder.size_kbyte=1024 \
    persist.vendor.audio.ras.enabled=true \
    ro.config.vc_call_vol_steps=7 \
    ro.config.media_vol_steps=25 \
    ro.vendor.audio.sdk.fluencetype=fluence \
    ro.vendor.audio.sdk.ssr=false \
    ro.vendor.audio.sos=true \
    ro.vendor.audio.soundfx.usb=true \
    ro.vendor.audio.soundtrigger.lowpower=false \
    ro.vendor.audio.soundtrigger=xiaomi \
    ro.vendor.audio.voice.volume.boost=manual \
    vendor.audio.adm.buffering.ms=6 \
    vendor.audio.dolby.ds2.enabled=false \
    vendor.audio.dolby.ds2.hardbypass=false \
    vendor.audio.flac.sw.decoder.24bit=true \
    vendor.audio.hw.aac.encoder=true \
    vendor.audio.offload.buffer.size.kb=64 \
    vendor.audio.offload.gapless.enabled=true \
    vendor.audio.offload.multiaac.enable=true \
    vendor.audio.offload.multiple.enabled=false \
    vendor.audio.offload.passthrough=false \
    vendor.audio.offload.track.enable=false \
    vendor.audio.parser.ip.buffer.size=262144 \
    vendor.audio.safx.pbe.enabled=false \
    vendor.audio.tunnel.encode=false \
    vendor.audio.use.sw.alac.decoder=true \
    vendor.audio.use.sw.ape.decoder=true \
    vendor.audio_hal.period_size=192 \
    vendor.audio.spkr_prot.tx.sampling_rate=48000 \
    vendor.fm.a2dp.conc.disabled=true \
    vendor.voice.path.for.pcm.voip=true

# Audio Feature
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.audio.feature.a2dp_offload.enable=false \
    vendor.audio.feature.afe_proxy.enable=true \
    vendor.audio.feature.anc_headset.enable=true \
    vendor.audio.feature.battery_listener.enable=false \
    vendor.audio.feature.compr_cap.enable=false \
    vendor.audio.feature.compress_in.enable=false \
    vendor.audio.feature.compress_meta_data.enable=true \
    vendor.audio.feature.compr_voip.enable=true \
    vendor.audio.feature.concurrent_capture.enable=false \
    vendor.audio.feature.custom_stereo.enable=true \
    vendor.audio.feature.display_port.enable=false \
    vendor.audio.feature.dsm_feedback.enable=false \
    vendor.audio.feature.dynamic_ecns.enable=false \
    vendor.audio.feature.ext_hw_plugin.enable=false \
    vendor.audio.feature.external_dsp.enable=false \
    vendor.audio.feature.external_speaker.enable=false \
    vendor.audio.feature.external_speaker_tfa.enable=false \
    vendor.audio.feature.fluence.enable=true \
    vendor.audio.feature.fm.enable=true \
    vendor.audio.feature.hdmi_edid.enable=false \
    vendor.audio.feature.hdmi_passthrough.enable=false \
    vendor.audio.feature.hfp.enable=false \
    vendor.audio.feature.hifi_audio.enable=true \
    vendor.audio.feature.hwdep_cal.enable=false \
    vendor.audio.feature.incall_music.enable=false \
    vendor.audio.feature.multi_voice_session.enable=true \
    vendor.audio.feature.keep_alive.enable=false \
    vendor.audio.feature.kpi_optimize.enable=true \
    vendor.audio.feature.maxx_audio.enable=false \
    vendor.audio.feature.ras.enable=false \
    vendor.audio.feature.record_play_concurency.enable=false \
    vendor.audio.feature.src_trkn.enable=true \
    vendor.audio.feature.spkr_prot.enable=false \
    vendor.audio.feature.ssrec.enable=false \
    vendor.audio.feature.usb_offload.enable=false \
    vendor.audio.feature.usb_offload_burst_mode.enable=false \
    vendor.audio.feature.usb_offload_sidetone_volume.enable=false \
    vendor.audio.feature.deepbuffer_as_primary.enable=false \
    vendor.audio.feature.vbat.enable=true \
    vendor.audio.feature.wsa.enable=true \
    vendor.audio.feature.audiozoom.enable=false \
    vendor.audio.feature.snd_mon.enable=false

# Bluetooth & FM
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.qcom.bluetooth.soc=cherokee \
    persist.bluetooth.bluetooth_audio_hal.disabled=true \
    ro.vendor.bluetooth.wipower=false \
    persist.vendor.bt.a2dp_offload_cap=sbc-aptx-aptxhd-aac \
    vendor.fm.a2dp.conc.disabled=true \
    vendor.hw.fm.init=0

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    persist.bokeh.switch.lux=290 \
    persist.flash.low.lux=390 \
    persist.flash.light.lux=340 \
    persist.imx376_sunny.low.lux=310 \
    persist.imx376_sunny.light.lux=280 \
    persist.imx376_ofilm.low.lux=310 \
    persist.imx376_ofilm.light.lux=280 \
    persist.sys.exif.make=Xiaomi \
    persist.radio.VT_CAM_INTERFACE=2 \
    ro.eyecare.brightness.threshold=3 \
    ro.eyecare.brightness.level=8 \
    ro.hist.brightness.threshold=5 \
    persist.vendor.camera.multicam.hwsync=TRUE \
    persist.vendor.camera.multicam.fpsmatch=TRUE \
    persist.vendor.camera.enableAdvanceFeatures=0x347 \
    persist.vendor.camera.display.umax=1920x1080 \
    persist.vendor.camera.display.lmax=1280x720 \
    vidc.enc.dcvs.extra-buff-count=2 \
    persist.vendor.camera.eis.enable=0 \
    persist.camera.eis.enable=0 \
    persist.vendor.camera.stats.test=0 \
    persist.vendor.camera.linkpreview=0 \
    persist.vendor.camera.awb.sync=2 \
    persist.vendor.camera.fdvideo=1 \
    persist.vendor.camera.mfnrframenum=8 \
    persist.vendor.camera.multicam=TRUE \
    persist.vendor.camera.multicam.framesync=1 \
    persist.vendor.camera.auxswitch.threshold=330 \
    persist.vendor.camera.mainswitch.threshold=419 \
    persist.vendor.ov13855_sunny.low.lux=385 \
    persist.vendor.ov13855_sunny.light.lux=370 \
    persist.vendor.s5k3l8_ofilm.low.lux=379 \
    persist.vendor.s5k3l8_ofilm.light.lux=367 \
    persist.vendor.camera.stats.test=5 \
    persist.vendor.camera.depth.focus.cb=0 \
    persist.vendor.imx376_sunny.low.lux=290 \
    persist.vendor.imx376_sunny.light.lux=275 \
    persist.vendor.imx376_ofilm.low.lux=290 \
    persist.vendor.imx376_ofilm.light.lux=275 \
    persist.vendor.bokeh.switch.lux=290 \
    persist.vendor.camera.exif.make=Xiaomi \
    persist.vendor.camera.preview.ubwc=0 \
    persist.vendor.camera.isp.clock.optmz=0 \
    persist.vendor.camera.isp.turbo=1 \
    persist.vendor.camera.imglib.usefdlite=1 \
    persist.vendor.camera.expose.aux=1 \
    persist.vendor.camera.HAL3.enabled=1 \
    persist.vendor.camera.manufacturer=Xiaomi \
    persist.vendor.camera.model=Redmi Note 7 \
    persist.vendor.camera.privapp.list=org.codeaurora.snapcam \
    persist.camera.privapp.list=org.codeaurora.snapcam \
    vendor.camera.aux.packagelist=org.codeaurora.snapcam

# Codec2 switch
PRODUCT_PROPERTY_OVERRIDES += \
    debug.media.codec2=2

# DRM
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    sys.display-size=1920x1080

# Misc
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.qcomsysd.enabled=1 \
    qemu.hw.mainkeys=0 \
    ro.build.shutdown_timeout=0 \
    ro.control_privapp_permissions=log \
    ro.hardware.nfc_nci=nqx.default \
    ro.vendor.extension_library=libqti-perfd-client.so \
    ro.frp.pst=/dev/block/bootdevice/by-name/frp \
    ro.opengles.version=196610 \
    ro.sf.lcd_density=403 \
    sys.vendor.shutdown.waittime=500 \
    vendor.video.disable.ubwc=1

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.radio.apm_sim_not_pwdn=1 \
    persist.vendor.radio.sib16_support=1 \
    persist.vendor.radio.custom_ecc=1 \
    persist.vendor.radio.rat_on=combine \
    persist.vendor.radio.procedure_bytes=SKIP \
    persist.vendor.radio.flexmap_type=none \
    persist.backup.ntpServer=0.pool.ntp.org \
    persist.radio.multisim.config=dsds \
    rild.libpath=/system/vendor/lib64/libril-qc-hal-qmi.so \
    ro.com.android.dataroaming=false

# Radio IMS
PRODUCT_PROPERTY_OVERRIDES += \
    persist.dbg.ims_volte_enable=1 \
    persist.dbg.volte_avail_ovr=1 \
    persist.dbg.vt_avail_ovr=1 \
    persist.dbg.wfc_avail_ovr=1 \
    persist.vendor.radio.rat_on=combine \
    persist.vendor.radio.data_ltd_sys_ind=1 \
    persist.vendor.radio.data_con_rprt=1 \
    persist.radio.calls.on.ims=1 \
    persist.vendor.radio.procedure_bytes=SKIP \
    persist.sys.fflag.override.settings_network_and_internet_v2=true \
    ro.telephony.iwlan_operation_mode=legacy \
    ro.telephony.use_old_mnc_mcc_format=true


# Sensor
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.sensors.facing=false \
    ro.vendor.sensors.cmc=false \
    ro.vendor.sdk.sensors.gestures=false

# SurfaceFlinger
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.early_phase_offset_ns=1500000 \
    debug.sf.early_app_phase_offset_ns=1500000 \
    debug.sf.early_gl_phase_offset_ns=3000000 \
    debug.sf.early_gl_app_phase_offset_ns=15000000 \
    debug.sf.enable_gl_backpressure=1

# SurfaceFlinger
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.surface_flinger.force_hwc_copy_for_virtual_displays=true \
    ro.surface_flinger.max_virtual_display_dimension=4096 \
    ro.surface_flinger.vsync_event_phase_offset_ns=2000000 \
    ro.surface_flinger.vsync_sf_event_phase_offset_ns=6000000
