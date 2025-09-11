# Custom Prefix
CUSTOM_PREFIX := RisingOS_Revived_waffle_Version8.1

# GAPPS or Vanilla
ifeq ($(WITH_GMS),true)
    CUSTOM_PREFIX := $(CUSTOM_PREFIX)_Google_Applications
else
    CUSTOM_PREFIX := $(CUSTOM_PREFIX)_Vanilla
endif

# Accord + BCR matrix
ifeq ($(TARGET_INCLUDE_ACCORD),true)
    ifeq ($(BUILD_BCR),true)
        CUSTOM_PREFIX := $(CUSTOM_PREFIX)_Accord_BCR
    else
        CUSTOM_PREFIX := $(CUSTOM_PREFIX)_Accord_No_BCR
    endif
else
    ifeq ($(TARGET_PREBUILT_BCR),true)
        CUSTOM_PREFIX := $(CUSTOM_PREFIX)_No_Accord_BCR
    else
        CUSTOM_PREFIX := $(CUSTOM_PREFIX)_No_Accord_or_BCR
    endif
endif

# Final package names
RISING_TARGET_PACKAGE := \
    $(PRODUCT_OUT)/$(CUSTOM_PREFIX)-ota.zip

RISING_TARGET_UPDATEPACKAGE := \
    $(PRODUCT_OUT)/$(CUSTOM_PREFIX)-Fastboot.zip

.PHONY: print-names
print-names:
	@echo "OTA package: $(RISING_TARGET_PACKAGE)"
	@echo "Fastboot package: $(RISING_TARGET_UPDATEPACKAGE)"

