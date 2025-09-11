# device/oneplus/waffle/overrides.mk
#
# Force override of LINEAGE_DISPLAY_VERSION.
# This file must be included LAST in lineage_waffle.mk (after version.mk / rising_override.mk).

override LINEAGE_DISPLAY_VERSION := $(CUSTOM_PREFIX)

# Also update ro.lineage.display.version in PRODUCT_SYSTEM_PROPERTIES
# also fix the system property
PRODUCT_SYSTEM_PROPERTIES := $(filter-out ro.lineage.display.version=%,$(PRODUCT_SYSTEM_PROPERTIES))
PRODUCT_SYSTEM_PROPERTIES += ro.lineage.display.version=$(LINEAGE_DISPLAY_VERSION)

# Optional: print debug info during lunch/build
$(warning [waffle overrides] LINEAGE_DISPLAY_VERSION forced to $(LINEAGE_DISPLAY_VERSION))

override RISING_TARGET_UPDATEPACKAGE = $(PRODUCT_OUT)/$(CUSTOM_PREFIX)-fastboot.zip
override RISING_TARGET_PACKAGE = $(PRODUCT_OUT)/$(CUSTOM_PREFIX)-ota.zip
