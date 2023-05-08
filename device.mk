#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# APEX's
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Enable virtual A/B OTA
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc

# ANT+
PRODUCT_PACKAGES += \
    AntHalService-Soong \
    com.dsi.ant@1.0.vendor

# API Level
PRODUCT_SHIPPING_API_LEVEL := 30

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@6.0-impl \
    android.hardware.audio.effect@6.0-impl \
    android.hardware.audio.service \
    android.hardware.bluetooth.audio-impl \
    android.hardware.soundtrigger@2.3-impl \
    audio.bluetooth.default \
    audio.primary.default \
    libaudio-resampler

PRODUCT_PRODUCT_PROPERTIES += \
    audio_para_version=C3Q-Audiopara-V01-20211102 \
    audio.offload.min.duration.secs=30 \
    audio.sys.offload.pstimeout.secs=3 \
    ro.config.vc_call_vol_steps=11

PRODUCT_VENDOR_PROPERTIES += \
    aaudio.hw_burst_min_usec=2000 \
    aaudio.mmap_exclusive_policy=2 \
    aaudio.mmap_policy=2 \
    persist.vendor.audio.ambisonic.auto.profile=false \
    persist.vendor.audio.ambisonic.capture=false \
    persist.vendor.audio.apptype.multirec.enabled=false \
    persist.vendor.audio.avs.afe_api_version=2 \
    persist.vendor.audio.fluence.tmic.enabled=false \
    persist.vendor.audio.fluence.voicecomm=true \
    persist.vendor.audio.ras.enabled=false \
    persist.vendor.audio.spv3.enable=true \
    persist.vendor.audio.voicecall.speaker.stereo=true \
    ro.vendor.audio.afe.record=true \
    ro.vendor.audio.misound.bluetooth.enable=true \
    ro.vendor.audio.policy.engine.odm=true \
    ro.vendor.audio.scenario.support=false \
    ro.vendor.audio.sdk.fluencetype=none \
    ro.vendor.audio.sdk.ssr=false \
    ro.vendor.audio.sfx.earadj=true \
    ro.vendor.audio.sfx.scenario=false \
    ro.vendor.audio.sos=true \
    ro.vendor.audio.soundfx.type=mi \
    ro.vendor.audio.soundfx.usb=true \
    ro.vendor.audio.spk.clean=true \
    ro.vendor.audio.surround.support=false \
    ro.vendor.audio.vocal.support=false \
    ro.vendor.audio.voice.change.support=true \
    vendor.audio.dolby.ds2.enabled=false \
    vendor.audio.dolby.ds2.hardbypass=false \
    vendor.audio.enable.mirrorlink=false \
    vendor.audio.feature.a2dp_offload.enable=true \
    vendor.audio.feature.afe_proxy.enable=true \
    vendor.audio.feature.anc_headset.enable=true \
    vendor.audio.feature.audiozoom.enable=false \
    vendor.audio.feature.battery_listener.enable=true \
    vendor.audio.feature.compr_cap.enable=false \
    vendor.audio.feature.compr_voip.enable=false \
    vendor.audio.feature.compress_in.enable=true \
    vendor.audio.feature.compress_meta_data.enable=true \
    vendor.audio.feature.concurrent_capture.enable=true \
    vendor.audio.feature.custom_stereo.enable=true \
    vendor.audio.feature.deepbuffer_as_primary.enable=false \
    vendor.audio.feature.display_port.enable=true \
    vendor.audio.feature.dsm_feedback.enable=false \
    vendor.audio.feature.ext_hw_plugin.enable=false \
    vendor.audio.feature.external_dsp.enable=false \
    vendor.audio.feature.external_speaker.enable=false \
    vendor.audio.feature.external_speaker_tfa.enable=false \
    vendor.audio.feature.fluence.enable=true \
    vendor.audio.feature.fm.enable=true \
    vendor.audio.feature.hdmi_edid.enable=true \
    vendor.audio.feature.hdmi_passthrough.enable=true \
    vendor.audio.feature.hfp.enable=true \
    vendor.audio.feature.hifi_audio.enable=false \
    vendor.audio.feature.hwdep_cal.enable=false \
    vendor.audio.feature.incall_music.enable=true \
    vendor.audio.feature.keep_alive.enable=true \
    vendor.audio.feature.maxx_audio.enable=false \
    vendor.audio.feature.multi_voice_session.enable=true \
    vendor.audio.feature.ras.enable=true \
    vendor.audio.feature.record_play_concurency.enable=false \
    vendor.audio.feature.snd_mon.enable=true \
    vendor.audio.feature.spkr_prot.enable=false \
    vendor.audio.feature.src_trkn.enable=true \
    vendor.audio.feature.ssrec.enable=true \
    vendor.audio.feature.usb_offload.enable=true \
    vendor.audio.feature.usb_offload_burst_mode.enable=true \
    vendor.audio.feature.usb_offload_sidetone_volume.enable=false \
    vendor.audio.feature.vbat.enable=true \
    vendor.audio.feature.wsa.enable=false \
    vendor.audio.flac.sw.decoder.24bit=true \
    vendor.audio.hal.boot.timeout.ms=20000 \
    vendor.audio.hal.output.suspend.supported=true \
    vendor.audio.hw.aac.encoder=true \
    vendor.audio.offload.buffer.size.kb=32 \
    vendor.audio.offload.gapless.enabled=true \
    vendor.audio.offload.multiaac.enable=true \
    vendor.audio.offload.multiple.enabled=false \
    vendor.audio.offload.passthrough=false \
    vendor.audio.offload.track.enable=true \
    vendor.audio.parser.ip.buffer.size=262144 \
    vendor.audio.safx.pbe.enabled=false \
    vendor.audio.tunnel.encode=false \
    vendor.audio.use.sw.alac.decoder=true \
    vendor.audio.use.sw.ape.decoder=true \
    vendor.audio.use.sw.mpegh.decoder=true \
    vendor.audio.volume.headset.gain.depcal=true \
    vendor.audio_hal.in_period_size=144 \
    vendor.audio_hal.period_multiplier=3 \
    vendor.voice.path.for.pcm.voip=true

# Audio configs
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/audio/,$(TARGET_COPY_OUT_VENDOR)/etc)

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.pro.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0.vendor \
    vendor.qti.hardware.bluetooth_audio@2.0.vendor \
    vendor.qti.hardware.bluetooth_audio@2.1.vendor

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml

PRODUCT_COPY_FILES += \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/common/bluetooth_qti_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_qti_audio_policy_configuration.xml

PRODUCT_SYSTEM_PROPERTIES += \
    persist.bluetooth.disableabsvol=true \
    persist.sys.btstack.absvolfeature=false \
    persist.vendor.bt.a2dp.absvolfeature=false \
    vendor.bluetooth.soc=cherokee

PRODUCT_VENDOR_PROPERTIES += \
    bluetooth.device.class_of_device=90,2,12 \
    bluetooth.hardware.power.idle_cur_ma=7 \
    bluetooth.hardware.power.operating_voltage_mv=3700 \
    bluetooth.hardware.power.rx_cur_ma=75 \
    bluetooth.hardware.power.tx_cur_ma=93 \
    bluetooth.profile.asha.central.enabled?=true \
    bluetooth.profile.a2dp.source.enabled?=true \
    bluetooth.profile.avrcp.target.enabled?=true \
    bluetooth.profile.bap.broadcast.assist.enabled?=true \
    bluetooth.profile.bap.unicast.client.enabled?=true \
    bluetooth.profile.bas.client.enabled?=true \
    bluetooth.profile.ccp.server.enabled?=true \
    bluetooth.profile.csip.set_coordinator.enabled?=true \
    bluetooth.profile.gatt.enabled?=true \
    bluetooth.profile.hap.client.enabled?=true \
    bluetooth.profile.hfp.ag.enabled?=true \
    bluetooth.profile.hid.device.enabled?=true \
    bluetooth.profile.hid.host.enabled?=true \
    bluetooth.profile.map.server.enabled?=true \
    bluetooth.profile.mcp.server.enabled?=true \
    bluetooth.profile.opp.enabled?=true \
    bluetooth.profile.pan.nap.enabled?=true \
    bluetooth.profile.pan.panu.enabled?=true \
    bluetooth.profile.pbap.server.enabled?=true \
    bluetooth.profile.sap.server.enabled?=true \
    bluetooth.profile.vcp.controller.enabled?=true \
    persist.bluetooth.a2dp_offload.cap=sbc-aac-aptx-aptxhd-ldac \
    persist.bluetooth.a2dp_offload.disabled=false \
    persist.vendor.bt.aac_frm_ctl.enabled=true \
    persist.vendor.bt.a2dp.mac_whitelist=false \
    persist.vendor.qcom.bluetooth.soc=cherokee \
    persist.vendor.service.bdroid.sibs=false \
    ro.bluetooth.a2dp_offload.supported=true \
    ro.vendor.bluetooth.wipower=false \
    vendor.hw.fm.init=0 \
    vendor.qcom.bluetooth.soc=cherokee

# Boot animation
TARGET_SCREEN_HEIGHT := 1650
TARGET_SCREEN_WIDTH := 720

# Bootcontrol
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl-qti \
    android.hardware.boot@1.2-impl-qti.recovery \
    android.hardware.boot@1.2-service

PRODUCT_PACKAGES_DEBUG += \
    bootctl

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service_64 \
    libcamera2ndk_vendor \
    libstdc++.vendor \
    vendor.qti.hardware.camera.device@1.0.vendor \
    vendor.qti.hardware.camera.postproc@1.0.vendor

# Camera
PRODUCT_PACKAGES += \
    libpiex_shim

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml

PRODUCT_SYSTEM_PROPERTIES += \
    camera.disable_zsl_mode=true \
    persist.vendor.camera.privapp.list=org.codeaurora.snapcam,com.android.camera,com.google.camera,org.lineageos.aperture

# Charger
PRODUCT_SYSTEM_PROPERTIES += \
    ro.charger.disable_init_blank=true \
    ro.charger.enable_suspend=true

PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.quick.charge=1

# CNE
PRODUCT_SYSTEM_PROPERTIES += \
    persist.cne.feature=1

# Configs File System
PRODUCT_PACKAGES += \
    fs_config_files

# Configstore
PRODUCT_PACKAGES += \
    disable_configstore

# Crypto
PRODUCT_VENDOR_PROPERTIES += \
    ro.crypto.allow_encrypt_override=true \
    ro.crypto.dm_default_key.options_format.version=2 \
    ro.crypto.volume.filenames_mode=aes-256-cts \
    ro.crypto.volume.metadata.method=dm-default-key

# Dalvik
PRODUCT_SYSTEM_PROPERTIES += \
    dalvik.vm.dex2oat64.enabled=true

PRODUCT_VENDOR_PROPERTIES += \
    dalvik.vm.systemuicompilerfilter=speed

# Display
PRODUCT_SYSTEM_PROPERTIES += \
    debug.cpurend.vsync=false \
    debug.hwui.skia_atrace_enabled=false \
    debug.sf.auto_latch_unsignaled=0 \
    ro.surface_flinger.supports_background_blur=0

PRODUCT_VENDOR_PROPERTIES += \
    vendor.display.camera_noc_efficiency_factor=0.70 \
    vendor.display.comp_mask=0 \
    vendor.display.disable_excl_rect=0 \
    vendor.display.disable_excl_rect_partial_fb=1 \
    vendor.display.disable_idle_time_hdr=1 \
    vendor.display.disable_idle_time_video=1 \
    vendor.display.disable_layer_stitch=0 \
    vendor.display.disable_rotator_downscale=1 \
    vendor.display.disable_rotator_ubwc=1 \
    vendor.display.disable_rounded_corner_thread=1 \
    vendor.display.disable_scaler=0 \
    vendor.display.enable_allow_idle_fallback=1 \
    vendor.display.enable_async_powermode=1 \
    vendor.display.enable_camera_smooth=1 \
    vendor.display.enable_optimize_refresh=1 \
    vendor.display.enable_perf_hint_large_comp_cycle=1 \
    vendor.display.enable_posted_start_dyn=1 \
    vendor.display.enable_rc_support=1 \
    vendor.display.enable_rounded_corner=0 \
    vendor.display.normal_noc_efficiency_factor=0.85 \
    vendor.display.qdcm.disable_factory_mode=1 \
    vendor.display.qdcm.mode_combine=1 \
    vendor.display.secure_preview_buffer_format=420_sp \
    vendor.display.use_layer_ext=0

PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.display.sensortype=2 \
    ro.vendor.display.svi=1 \
    vendor.display.idle_time=0 \
    vendor.display.svi.config=1 \
    vendor.display.svi.config_path=/vendor/etc/SVIConfig.xml

# Device ID
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.device_id_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_id_attestation.xml

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Dex/ART optimization
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false
PRODUCT_DEX_PREOPT_DEFAULT_COMPILER_FILTER := verify
USE_DEX2OAT_DEBUG := false

# Dex2oat
PRODUCT_VENDOR_PROPERTIES += \
    dalvik.vm.boot-dex2oat-cpu-set=0,1,2,3,4,5,6,7 \
    dalvik.vm.boot-dex2oat-threads=8 \
    dalvik.vm.image-dex2oat-cpu-set=0,1,2,3,4,5,6,7 \
    dalvik.vm.image-dex2oat-threads=8

# Display
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml

# DPM
PRODUCT_SYSTEM_PROPERTIES += \
    persist.dpm.feature=1

PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.dpmhalservice.enable=1

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.4.vendor \
    android.hardware.drm-service.clearkey

PRODUCT_VENDOR_PROPERTIES += \
    drm.service.enabled=true

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.3-service.xiaomi

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

PRODUCT_SYSTEM_PROPERTIES += \
    sys.fp.miui.token=0

# FM
PRODUCT_PACKAGES += \
    FM2 \
    qcom.fmradio

PRODUCT_PRODUCT_PROPERTIES += \
    persist.vendor.qti.telephony.vt_cam_interface=2

PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.data.iwlan.enable=true \
    persist.vendor.radio.atfwd.start=true \
    persist.vendor.radio.data_con_rprt=1 \
    persist.vendor.radio.enable_temp_dds=true \
    persist.vendor.radio.manual_nw_rej_ct=1 \
    persist.vendor.radio.mt_sms_ack=30 \
    persist.vendor.radio.report_codec=1 \
    persist.vendor.radio.snapshot_enabled=1 \
    persist.vendor.radio.snapshot_timer=5 \
    persist.vendor.radio.vdp_on_ims_cap=1

# FRP
PRODUCT_VENDOR_PROPERTIES += \
    ro.frp.pst=/dev/block/bootdevice/by-name/frp

# Fwk detect
PRODUCT_ODM_PROPERTIES += \
    ro.vendor.qti.va_odm.support=1

PRODUCT_SYSTEM_PROPERTIES += \
    ro.vendor.qti.va_aosp.support=1    

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0.vendor

# Graphics
PRODUCT_SYSTEM_PROPERTIES += \
    persist.demo.hdmirotationlock=false

PRODUCT_VENDOR_PROPERTIES += \
    debug.hwui.renderer=skiagl \
    debug.mdpcomp.logs=0 \
    debug.sdm.support_writeback=0 \
    persist.sys.sf.color_saturation=1.0 \
    ro.hardware.egl=adreno \
    ro.hardware.vulkan=adreno \
    ro.opengles.version=196610 \
    vendor.gralloc.disable_ubwc=0 \
    vendor.gralloc.secure_preview_buffer_format=420_sp

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-impl.recovery \
    android.hardware.health@2.1-service

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.base@1.0.vendor \
    libhidltransport.vendor \
    libhwbinder.vendor

PRODUCT_COPY_FILES += \
    prebuilts/vndk/v32/arm64/arch-arm-armv8-a/shared/vndk-sp/libhidlbase.so:$(TARGET_COPY_OUT_VENDOR)/lib/libhidlbase-v32.so \
    prebuilts/vndk/v32/arm64/arch-arm64-armv8-a/shared/vndk-sp/libhidlbase.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libhidlbase-v32.so

# HotwordEnrollement app permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/permissions/privapp-permissions-hotword.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-hotword.xml

# IFAA manager
PRODUCT_PACKAGES += \
    IFAAService

# Inherit several Android Go Configurations(Beneficial for everyone, even on non-Go devices)
PRODUCT_USE_PROFILE_FOR_BOOT_IMAGE := true
PRODUCT_DEX_PREOPT_BOOT_IMAGE_PROFILE_LOCATION := frameworks/base/config/boot-image-profile.txt

# Iorapd
PRODUCT_SYSTEM_PROPERTIES += \
    ro.iorapd.enable=false \
    iorapd.perfetto.enable=false \
    iorapd.readahead.enable=false \
    persist.device_config.runtime_native_boot.iorap_readahead_enable=false

# IRQ balance
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/configs/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-fpc.kl \
    $(LOCAL_PATH)/configs/keylayout/uinput-goodix.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-goodix.kl \
    $(LOCAL_PATH)/configs/keylayout/uinput-silead.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-silead.kl

# Kernel
PRODUCT_SET_DEBUGFS_RESTRICTIONS := true

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.1.vendor

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light-service.xiaomi

# LMKD
PRODUCT_SYSTEM_PROPERTIES += \
    ro.lmk.kill_heaviest_task=true \
    ro.lmk.kill_timeout_ms=50 \
    ro.lmk.stall_limit_critical=40 \
    ro.lmk.swap_util_max=90 \
    ro.lmk.thrashing_limit=30 \
    ro.lmk.thrashing_limit_decay=25 \
    ro.lmk.thrashing_limit_critical=30 \
    ro.lmk.psi_complete_stall_ms=120 \
    ro.lmk.psi_partial_stall_ms=50 \
    ro.lmk.filecache_min_kb=300000

# Logs
PRODUCT_SYSTEM_PROPERTIES += \
    persist.log.tag.AnalyticsService=S \
    persist.log.tag.KernelCpuUidActiveTimeReader=S \
    persist.log.tag.Tracer=S \
    persist.log.tag.NearbySharing=S \
    persist.log.tag.IntervalStats=S \
    persist.log.tag.CompatibilityChangeReporter=S \
    persist.log.tag.SQLiteLog=S \
    persist.log.tag.wificond=S \
    persist.log.tag.b/223498680=S \
    persist.log.tag.TrafficStats=S \
    persist.log.tag.ContrastColorUtil=S \
    persist.log.tag.GRALLOC=S \
    persist.log.tag.gralloc4=S
    
# Media
PRODUCT_PACKAGES += \
    libavservices_minijail_vendor \
    libcodec2_soft_common.vendor \
    libsfplugin_ccodec_utils.vendor

PRODUCT_SYSTEM_PROPERTIES += \
    debug.stagefright.omx_default_rank=0 \
    debug.stagefright.omx_default_rank.sw-audio=1 \
    media.aac_51_output_enabled=true \
    media.stagefright.enable-aac=true \
    media.stagefright.enable-fma2dp=true \
    media.stagefright.enable-http=true \
    media.stagefright.enable-player=true \
    media.stagefright.enable-qcp=true \
    media.stagefright.enable-scan=true \
    mmp.enable.3g2=true \
    persist.mm.enable.prefetch=true \
    ro.config.media_vol_default=10

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    vendor.mm.enable.qcom_parser=16777215

# Network
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml

# Netmgr
PRODUCT_SYSTEM_PROPERTIES += \
    persist.data.netmgrd.qos.enable=true

# Neural Networks
PRODUCT_PACKAGES += \
    android.hardware.neuralnetworks@1.3.vendor

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2-service \
    com.android.nfc_extras \
    libchrome.vendor \
    NfcNci \
    SecureElement \
    Tag

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_c3qn/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_c3qn/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_c3qn/android.hardware.nfc.uicc.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_c3qn/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.uicc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_c3qn/android.hardware.se.omapi.uicc.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_c3qn/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_c3qn/com.nxp.mifare.xml

PRODUCT_SYSTEM_PROPERTIES += \
    ro.nfc.port=I2C

PRODUCT_VENDOR_PROPERTIES += \
    ro.hardware.nfc_nci=pn8x \
    ro.vendor.se.type=HCE,UICC

# Netflix
PRODUCT_SYSTEM_PROPERTIES += \
    ro.netflix.channel=004ee050-1a17-11e9-bb61-6f1da27fb55b \
    ro.netflix.signup=1

PRODUCT_VENDOR_PROPERTIES += \
    vendor.netflix.bsp_rev=Q6115-31409-1

# Overlays
PRODUCT_PACKAGES += \
    CarrierConfigFog \
    DialerFog \
    FrameworksFog \
    FrameworksFogIN2 \
    NoCutoutOverlay \
    SettingsFog \
    SettingsProviderFog \
    SettingsProviderFogCommon \
    SettingsProviderFogIN \
    SettingsProviderFogIN2 \
    SettingsProviderRain \
    SettingsProviderWind \
    SystemUIFog \
    TelephonyFog \
    WifiFog

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Platform
TARGET_BOARD_PLATFORM := bengal

# Phantom process monitoring
PRODUCT_PRODUCT_PROPERTIES += \
    sys.fflag.override.settings_enable_monitor_phantom_procs=false

# Public libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

# Perf
PRODUCT_PACKAGES += \
    libqti-perfd-client

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.2.vendor \
    android.hardware.power-service-qti

# Preopted ODEX
PRODUCT_SYSTEM_PROPERTIES += \
    ro.cp_system_other_odex=1

# QMI
PRODUCT_PACKAGES += \
    libjson \
    libqti_vndfwk_detect \
    libqti_vndfwk_detect.vendor \
    libvndfwk_detect_jni.qti.vendor

# QTI Components
TARGET_COMMON_QTI_COMPONENTS := \
    alarm \
    audio \
    av \
    bt \
    display \
    gps \
    media \
    overlay \
    perf \
    telephony \
    vibrator \
    wfd \
    wlan
    
# RIL
PRODUCT_PACKAGES += \
    android.hardware.radio@1.5.vendor \
    libprotobuf-cpp-full \
    librmnetctl \
    libxml2

PRODUCT_SYSTEM_PROPERTIES += \
    ro.vendor.radio.features_common=3

PRODUCT_VENDOR_PROPERTIES += \
    vendor.rild.libpath=/vendor/lib64/libril-qc-hal-qmi.so

# Rootdir
PRODUCT_PACKAGES += \
    init.qcom.early_boot.sh \
    init.qcom.post_boot.sh \
    init.qcom.usb.sh \
    init.qcom.sh

PRODUCT_PACKAGES += \
    fstab.qcom \
    fstab.qcom_ramdisk \
    fstab.zram \
    init.qcom.rc \
    init.fog.usb.rc \
    init.recovery.qcom.rc \
    init.target.rc \
    ueventd.qcom.rc

# Sensors
PRODUCT_PACKAGES += \
    android.frameworks.sensorservice@1.0 \
    android.frameworks.sensorservice@1.0.vendor \
    android.hardware.sensors@2.1-service.multihal \
    libsensorndkbridge

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf
    
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml

PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.sensors.debug.ssc_qmi_debug=true \
    persist.vendor.sensors.enable.bypass_worker=true \
    persist.vendor.sensors.enable.rt_task=false \
    persist.vendor.sensors.hal_trigger_ssr=false \
    persist.vendor.sensors.support_direct_channel=false

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/qcom-caf/bootctrl \
    hardware/xiaomi

# SoC
PRODUCT_VENDOR_PROPERTIES += \
    ro.soc.manufacturer=QTI \
    ro.soc.model=SM6225

# SurfaceFlinger
PRODUCT_VENDOR_PROPERTIES += \
    debug.sf.enable_advanced_sf_phase_offset=1 \
    debug.sf.enable_egl_image_tracker=0 \
    debug.sf.enable_transaction_tracing=false \
    debug.sf.high_fps_early_gl_phase_offset_ns=-5000000 \
    debug.sf.high_fps_early_phase_offset_ns=-5000000 \
    debug.sf.high_fps_late_app_phase_offset_ns=1000000 \
    debug.sf.high_fps_late_sf_phase_offset_ns=-5000000 \
    debug.sf.phase_offset_threshold_for_next_vsync_ns=6100000 \
    ro.surface_flinger.force_hwc_copy_for_virtual_displays=true \
    ro.surface_flinger.has_HDR_display=true \
    ro.surface_flinger.has_wide_color_display=true \
    ro.surface_flinger.max_virtual_display_dimension=4096 \
    ro.surface_flinger.protected_contents=true \
    ro.surface_flinger.set_display_power_timer_ms=1000 \
    ro.surface_flinger.set_idle_timer_ms=500 \
    ro.surface_flinger.set_touch_timer_ms=800 \
    ro.surface_flinger.use_color_management=true \
    ro.surface_flinger.vsync_event_phase_offset_ns=2000000 \
    ro.surface_flinger.vsync_sf_event_phase_offset_ns=6000000 \
    ro.surface_flinger.wcg_composition_dataspace=143261696

# Thermal
PRODUCT_VENDOR_PROPERTIES += \
    vendor.sys.thermal.data.path=/data/vendor/thermal/

# Time-services
PRODUCT_SYSTEM_PROPERTIES += \
    persist.timed.enable=true

# Update engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.basic

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml

PRODUCT_VENDOR_PROPERTIES += \
    vendor.usb.diag.func.name=diag \
    vendor.usb.dpl.inst.name=dpl \
    vendor.usb.qdss.inst.name=qdss \
    vendor.usb.rmnet.func.name=gsi \
    vendor.usb.rmnet.inst.name=rmnet \
    vendor.usb.rndis.func.name=gsi \
    vendor.usb.use_ffs_mtp=0 \
    vendor.usb.use_gadget_hal=0

# USB debugging at boot
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.debuggable=1

# Vendor service manager
PRODUCT_PACKAGES += \
    vndservicemanager

# Verify boot
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/android.software.verified_boot.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/excluded-input-devices.xml:$(TARGET_COPY_OUT_VENDOR)/etc/excluded-input-devices.xml

# VNDK
PRODUCT_EXTRA_VNDK_VERSIONS := 30

# Vulkan
PRODUCT_PACKAGES += \
    libvulkan

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-1.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_1.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml

# WiFi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf

PRODUCT_VENDOR_PROPERTIES += \
    wifi.aware.interface=wifi-aware0

# WLAN
# 0: no dbs, 1: 1x1 dbs, 2: 2x2 dbs
PRODUCT_SYSTEM_PROPERTIES += \
    ro.hardware.wlan.dbs=0

PRODUCT_VENDOR_PROPERTIES += \
    ro.telephony.iwlan_operation_mode=legacy

# WiFi Display
PRODUCT_PACKAGES += \
    libwfdaac_vendor

# Zygote
PRODUCT_SYSTEM_PROPERTIES += \
    persist.device_config.runtime_native.usap_pool_enabled=true

PRODUCT_VENDOR_PROPERTIES += \
    zygote.critical_window.minute=10

# Inherit from vendor blobs
$(call inherit-product, vendor/xiaomi/fog/fog-vendor.mk)
