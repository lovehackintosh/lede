include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=qca-nss-crypto
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://git.codelinaro.org/clo/qsdk/oss/lklm/nss-crypto.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=e7651c2986d30b5e8ca5ad6b9a72c47febdf3cca
PKG_MIRROR_HASH:=381ba448ccd9e0ff69fa52b3e10687b72260b7d0bf865cac10be7f159573b6c8

include $(INCLUDE_DIR)/package.mk

ifeq ($(CONFIG_TARGET_ipq),y)
subtarget:=$(SUBTARGET)
else
subtarget:=$(CONFIG_TARGET_BOARD)
endif

# v1.0 is for Akronite
# v2.0 is for Hawkeye/Cypress/Maple
ifneq (, $(findstring $(subtarget), "ipq807x" "ipq807x_64" "ipq60xx" "ipq60xx_64" "ipq50xx" "ipq50xx_64"))
NSS_CRYPTO_DIR:=v2.0
else
NSS_CRYPTO_DIR:=v1.0
endif

define KernelPackage/qca-nss-crypto/Default
  SECTION:=kernel
  CATEGORY:=Kernel modules
  SUBMENU:=Network Devices
  DEPENDS:=@(TARGET_ipq806x||TARGET_ipq807x||TARGET_ipq50xx||TARGET_ipq60xx) +kmod-qca-nss-drv
endef

define KernelPackage/qca-nss-crypto
  $(call KernelPackage/qca-nss-crypto/Default)
  TITLE:=Kernel driver for NSS crypto driver
  FILES:=$(PKG_BUILD_DIR)/$(NSS_CRYPTO_DIR)/src/qca-nss-crypto.ko \
	$(PKG_BUILD_DIR)/$(NSS_CRYPTO_DIR)/tool/qca-nss-crypto-tool.ko
  AUTOLOAD:=$(call AutoLoad,52,qca-nss-crypto)
endef

define KernelPackage/qca-nss-crypto/Description
This package contains a NSS crypto driver for QCA chipset
endef

define Build/InstallDev/qca-nss-crypto
	$(INSTALL_DIR) $(1)/usr/include/qca-nss-crypto
	$(CP) $(PKG_BUILD_DIR)/$(NSS_CRYPTO_DIR)/include/* $(1)/usr/include/qca-nss-crypto
endef

define Build/InstallDev
	$(call Build/InstallDev/qca-nss-crypto,$(1))
endef

EXTRA_CFLAGS+= \
	-DCONFIG_NSS_DEBUG_LEVEL=0 \
	-I$(STAGING_DIR)/usr/include/qca-nss-crypto \
	-I$(STAGING_DIR)/usr/include/qca-nss-drv \
	-I$(PKG_BUILD_DIR)/$(NSS_CRYPTO_DIR)/include \
	-I$(PKG_BUILD_DIR)/$(NSS_CRYPTO_DIR)/src

define Build/Compile
	$(MAKE) $(PKG_JOBS) -C "$(LINUX_DIR)" \
		$(KERNEL_MAKE_FLAGS) \
		$(PKG_MAKE_FLAGS) \
		M="$(PKG_BUILD_DIR)" \
		EXTRA_CFLAGS="$(EXTRA_CFLAGS)" \
		NSS_CRYPTO_DIR=$(NSS_CRYPTO_DIR) \
		SoC="$(subtarget)" \
		modules
endef

$(eval $(call KernelPackage,qca-nss-crypto))
