include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=crypto-hw-eip93
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define KernelPackage/crypto-hw-eip93
  SUBMENU:=Other modules
  TITLE:=EIP93 crypto HW accelerators
  DEPENDS:= +kmod-crypto-manager +kmod-crypto-authenc +kmod-crypto-des
  FILES:=$(PKG_BUILD_DIR)/crypto-hw-eip93.ko
  AUTOLOAD:=$(call AutoLoad,09,crypto-hw-eip93)
  KCONFIG:=
endef

define KernelPackage/crypto-hw-eip93/description
  EIP93 have various crypto HW accelerators. 
  Select this if you want to use the EIP93 modules for any of the crypto algorithms.
endef

EXTRA_KCONFIG:= \
	CONFIG_CRYPTO_DEV_EIP93=m \
	CONFIG_CRYPTO_DEV_EIP93_SKCIPHER=y \
	CONFIG_CRYPTO_DEV_EIP93_HMAC=y \
	CONFIG_CRYPTO_DEV_EIP93_AES=y \
	CONFIG_CRYPTO_DEV_EIP93_DES=y \
	CONFIG_CRYPTO_DEV_EIP93_AEAD=y

EXTRA_CFLAGS:= \
	$(patsubst CONFIG_%, -DCONFIG_%=1, $(patsubst %=m,%,$(filter %=m,$(EXTRA_KCONFIG)))) \
	$(patsubst CONFIG_%, -DCONFIG_%=1, $(patsubst %=y,%,$(filter %=y,$(EXTRA_KCONFIG)))) \

MAKE_OPTS:= \
	$(KERNEL_MAKE_FLAGS) \
	M="$(PKG_BUILD_DIR)" \
	EXTRA_CFLAGS="$(EXTRA_CFLAGS)" \
	$(EXTRA_KCONFIG)

define Build/Compile
	 $(MAKE) -C "$(LINUX_DIR)" \
		$(MAKE_OPTS) \
		modules
endef

$(eval $(call KernelPackage,crypto-hw-eip93))
