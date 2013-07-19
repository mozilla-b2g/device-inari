$(call inherit-product, device/qcom/common/common.mk)
PRODUCT_COPY_FILES := \
  device/qcom/inari/touchscreen.idc:system/usr/idc/Fts-touchscreen.idc \
  device/qcom/inari/touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \
  device/qcom/inari/touchscreen.idc:system/usr/idc/cyttsp-i2c.idc \
	device/qcom/inari/audio.conf:system/etc/bluetooth/audio.conf \
  device/qcom/otoro/media_profiles.xml:system/etc/media_profiles.xml \
  device/qcom/msm7627a/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

$(call inherit-product-if-exists, vendor/qcom/inari/inari-vendor-blobs.mk)
$(call inherit-product-if-exists, vendor/qcom/common/vendor-blobs.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)

PRODUCT_PROPERTY_OVERRIDES += \
  rild.libpath=/system/lib/libril-qc-1.so \
  rild.libargs=-d/dev/smd0 \
  ro.use_data_netmgrd=true \
  ro.moz.cam.0.sensor_offset=270 \
  ro.moz.ril.simstate_extra_field=true \
  ro.moz.ril.emergency_by_default=true \
  ro.moz.omx.hw.max_width=640 \
  ro.moz.omx.hw.max_height=360 \
  ro.sensor.arch.type=new \
  ro.moz.fm.noAnalog=true

# Discard inherited values and use our own instead.
PRODUCT_NAME := full_inari
PRODUCT_DEVICE := inari
PRODUCT_BRAND := toro
PRODUCT_MANUFACTURER := toro
PRODUCT_MODEL := inari1
ENABLE_LIBRECOVERY := true

PRODUCT_DEFAULT_PROPERTY_OVERRIDES := \
  persist.usb.serialno=$(PRODUCT_NAME)
