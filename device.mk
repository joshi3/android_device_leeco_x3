
# Dalvik heap configurations
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-3072-dalvik-heap.mk)

# Call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-3072-hwui-memory.mk)

# Vendor
$(call inherit-product, vendor/leeco/x3/x3-vendor-blobs.mk)

# Folder path
LOCAL_PATH := device/leeco/x3


# Manifest
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/manifest.xml: $(TARGET_COPY_OUT_VENDOR)/manifest.xml

	# TWRP
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/twrp.fstab:recovery/root/etc/twrp.fstab

# Overlay Folder
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Recovery allowed devices
TARGET_OTA_ASSERT_DEVICE := x3,X500,X507,X509,X3,x500,x507,x509,X502,x502

# Power
PRODUCT_PACKAGES += \
	power.default \
	power.mt6795

# Camera
PRODUCT_PACKAGES += \
	Snap \
	libcamera_parameters_ext

# Charger
PRODUCT_PACKAGES += \
	charger \
	charger_res_images

# Torch
PRODUCT_PACKAGES += \
	Torch
     
# Other
PRODUCT_PACKAGES += \
	librs_jni \
	libnl_2 \
	libemoji \
	com.android.future.usb.accessory

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	ro.allow.mock.location=0 \
	ro.debuggable=1 \
	ro.zygote=zygote64_32 \
	ro.dalvik.vm.native.bridge=0 \
	persist.sys.usb.config=mtp \
	persist.debug.xlog.enable=0 \
	camera.disable_zsl_mode=1

ifeq (lineage_x3,$(TARGET_PRODUCT))	#this is included only in lineage atm as some other roms have issue with this
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	dalvik.vm.dex2oat-Xms=64m \
	dalvik.vm.dex2oat-Xmx=512m \
	dalvik.vm.image-dex2oat-Xms=64m \
	dalvik.vm.image-dex2oat-Xmx=64m
endif

# PRODUCT_PROPERTY_OVERRIDES
PRODUCT_PROPERTY_OVERRIDES += \
	ro.kernel.android.checkjni=0 \
	ro.telephony.ril.config=fakeiccid \
	persist.call_recording.enabled=true \
	persist.call_recording.src=1




PRODUCT_TAGS += dalvik.gc.type-precise
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/gps/gps.conf:system/etc/gps.conf \
	$(LOCAL_PATH)/ramdisk/enableswap.sh:root/enableswap.sh \
	$(LOCAL_PATH)/ramdisk/factory_init.project.rc:root/factory_init.project.rc \
	$(LOCAL_PATH)/ramdisk/factory_init.rc:root/factory_init.rc \
	$(LOCAL_PATH)/ramdisk/fstab.mt6795:root/fstab.mt6795 \
	$(LOCAL_PATH)/ramdisk/init.modem.rc:root/init.modem.rc \
	$(LOCAL_PATH)/ramdisk/init.mt6795.rc:root/init.mt6795.rc \
	$(LOCAL_PATH)/ramdisk/init.mt6795.usb.rc:root/init.mt6795.usb.rc \
	$(LOCAL_PATH)/ramdisk/init.project.rc:root/init.project.rc \
	$(LOCAL_PATH)/ramdisk/ueventd.mt6795.rc:root/ueventd.mt6795.rc \
	$(LOCAL_PATH)/ramdisk/init.volte.rc:root/init.volte.rc \
	$(LOCAL_PATH)/ramdisk/init.mal.rc:root/init.mal.rc \
	$(LOCAL_PATH)/ramdisk/init.usb.configfs.rc:root/init.usb.configfs.rc \
	$(LOCAL_PATH)/ramdisk/init.trustonic.rc:root/init.trustonic.rc \
    $(LOCAL_PATH)/ramdisk/init.xlog.rc:root/init.xlog.
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/media/media_codecs.xml:system/etc/media_codecs.xml \
	$(LOCAL_PATH)/configs/media/media_codecs.xml:system/etc/permissions/media_codecs.xml \
#	$(LOCAL_PATH)/configs/media/media_codecs_ffmpeg.xml:system/etc/media_codecs_ffmpeg.xml \
	$(LOCAL_PATH)/configs/media/media_codecs_mediatek_audio.xml:system/etc/media_codecs_mediatek_audio.xml\
	$(LOCAL_PATH)/configs/media/media_codecs_mediatek_video.xml:system/etc/media_codecs_mediatek_video.xml \
	$(LOCAL_PATH)/configs/media/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
	$(LOCAL_PATH)/configs/media/media_profiles.xml:system/etc/media_profiles.xml \
	$(LOCAL_PATH)/configs/mtk_clear_motion.cfg:system/etc/mtk_clear_motion.cfg

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/audio/audio_device.xml: $(TARGET_COPY_OUT_VENDOR)/etc/audio_device.xml \
	$(LOCAL_PATH)/configs/audio/audio_effects.conf:system/etc/audio_effects.conf \
	$(LOCAL_PATH)/configs/audio/audio_em.xml:system/etc/audio_em.xml \
	$(LOCAL_PATH)/configs/audio/audio_policy.conf:system/etc/audio_policy.conf

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/permissions/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	$(LOCAL_PATH)/configs/permissions/android.hardware.microphone.xml:system/etc/permissions/android.hardware.microphone.xml \
	$(LOCAL_PATH)/configs/permissions/com.android.location.provider.xml:system/etc/permissions/com.android.location.provider.xml \
	$(LOCAL_PATH)/configs/permissions/com.android.media.remotedisplay.xml:system/etc/permissions/com.android.media.remotedisplay.xml \
	$(LOCAL_PATH)/configs/permissions/com.android.mediadrm.signer.xml:system/etc/permissions/com.android.mediadrm.signer.xml \
	$(LOCAL_PATH)/configs/permissions/android.hardware.camera.manual_postprocessing.xml:system/etc/permissions/android.hardware.camera.manual_postprocessing.xml \
	$(LOCAL_PATH)/configs/permissions/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml


PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/bluetooth/auto_pair_blacklist.conf:system/etc/bluetooth/auto_pair_blacklist.conf \
	$(LOCAL_PATH)/configs/bluetooth/auto_pair_devlist.conf:system/etc/bluetooth/auto_pair_devlist.conf \
	$(LOCAL_PATH)/configs/bluetooth/btconfig.xml:system/etc/bluetooth/btconfig.xml \
	$(LOCAL_PATH)/configs/bluetooth/bt_did.conf:system/etc/bluetooth/bt_did.conf \
	$(LOCAL_PATH)/configs/bluetooth/bt_stack.conf:system/etc/bluetooth/bt_stack.conf \
	$(LOCAL_PATH)/configs/bluetooth/bt_stack.conf.debug:system/etc/bluetooth/bt_stack.conf.debug \
	$(LOCAL_PATH)/configs/bluetooth/bt_stack.conf.sqc:system/etc/bluetooth/bt_stack.conf.sqc

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/keylayout/mtk-kpd.kl:system/usr/keylayout/mtk-kpd.kl \
	$(LOCAL_PATH)/configs/keylayout/ACCDET.kl:system/usr/keylayout/ACCDET.kl\
	$(LOCAL_PATH)/configs/keylayout/mtk-tpd.kl:system/usr/keylayout/mtk-tpd.kl\
	$(LOCAL_PATH)/configs/keylayout/synaptics_dsx_i2c.kl:system/usr/keylayout/synaptics_dsx_i2c.kl


PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/dhcpcd/dhcpcd-run-hooks:system/etc/dhcpcd/dhcpcd-run-hooks \
	$(LOCAL_PATH)/configs/dhcpcd/dhcpcd-hooks/20-dns.conf:system/etc/dhcpcd/dhcpcd-hooks/20-dns.conf \
	$(LOCAL_PATH)/configs/dhcpcd/dhcpcd-hooks/95-configured:system/etc/dhcpcd/dhcpcd-hooks/95-configured \
	$(LOCAL_PATH)/configs/wide-dhcpv6/dhcp6c.conf:system/etc/wide-dhcpv6/dhcp6c.conf \
	$(LOCAL_PATH)/configs/wide-dhcpv6/dhcp6c.script:system/etc/wide-dhcpv6/dhcp6c.script \
	$(LOCAL_PATH)/configs/wide-dhcpv6/dhcp6cctlkey:system/etc/wide-dhcpv6/dhcp6cctlkey \
	$(LOCAL_PATH)/configs/wide-dhcpv6/dhcp6cDNS.conf:system/etc/wide-dhcpv6/dhcp6cDNS.conf \
	$(LOCAL_PATH)/configs/wide-dhcpv6/dhcp6s.conf:system/etc/wide-dhcpv6/dhcp6s.conf

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/radvd/radvd.conf:system/etc/radvd/radvd.conf

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/slp_conf:system/etc/slp_conf \
	$(LOCAL_PATH)/configs/clatd.conf:system/etc/clatd.conf \
	$(LOCAL_PATH)/configs/custom.conf:system/etc/custom.conf \
	$(LOCAL_PATH)/configs/mtklog-config.prop:system/etc/mtklog-config.prop \
	$(LOCAL_PATH)/configs/mtk_omx_core.cfg:system/etc/mtk_omx_core.cfg \
	$(LOCAL_PATH)/configs/perfservboosttbl.txt:system/etc/perfservboosttbl.txt \
	$(LOCAL_PATH)/configs/perfservscntbl.txt:system/etc/perfservscntbl.txt



PRODUCT_PACKAGES += \
        fingerprint.default
 
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml


PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/hostapd/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \
	$(LOCAL_PATH)/configs/hostapd/hostapd.accept:system/etc/hostapd/hostapd.accept \
	$(LOCAL_PATH)/configs/hostapd/hostapd.deny:system/etc/hostapd/hostapd.deny


# MTK Helpers
PRODUCT_PACKAGES += \
	libccci_util \
   android.hardware.radio@1.0 \
   android.hardware.radio.deprecated@1.0 \
	libmtk_symbols

# Sensor Calibration
PRODUCT_PACKAGES += libem_sensor_jni

# Configure jemalloc for low memory
MALLOC_SVELTE := true

# Radio dependencies
PRODUCT_PACKAGES += \
	muxreport \
	terservice

# MTK Helpers
PRODUCT_PACKAGES += \
    libwvmsym \
    libiodev

# GPS
PRODUCT_PACKAGES += \
    android.hardware.gnss@1.0-impl \
    gps.mt6752 \
    libcurl \
    YGPS

# Mediaserver with system group
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,etc, $(TARGET_COPY_OUT_VENDOR)/etc)

# camera legacy
PRODUCT_PACKAGES += \
	fs_config_files

PRODUCT_PACKAGES += \
	libbwc \
	libm4u

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_as_supl.mk)

PRODUCT_TAGS += dalvik.gc.type-precise

# Audio HAL
PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-impl \
    android.hardware.audio.effect@2.0-impl \
    android.hardware.audio@2.0-service

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-impl \
    android.hardware.bluetooth@1.0-service \
    libbt-vendor

# Camera HAL
PRODUCT_PACKAGES += \
    camera.device@1.0-impl \
    camera.device@3.2-impl

# Graphic HAL
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.mapper@2.0-impl

# Health HAL
#PRODUCT_PACKAGES += \
 #   android.hardware.health@1.0-impl \
 #   android.hardware.health@1.0-service

# Keymaster HAL
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl

# Memtrack HAL
PRODUCT_PACKAGES += \
    android.hardware.memtrack@1.0-impl

# Power HAL
PRODUCT_PACKAGES += \
    android.hardware.power@1.0-impl

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-impl \
    android.hardware.light@2.0-service

# GPS force mode
PRODUCT_PROPERTY_OVERRIDES += \
    persist.force.gps.mode=gnss

# default.prop
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.adb.secure=0 \
    ro.secure=0

# Default OMX service to non-Treble
PRODUCT_PROPERTY_OVERRIDES += \
    persist.media.treble_omx=false