#
# Copyright (C) 2015 OpenWrt-dist
#
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ipv6helper
PKG_VERSION:=1.0
PKG_RELEASE:=2

PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=LEAN

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/ipv6helper
	SECTION:=ipv6
	TITLE:=IPv6 Helper and Dynamic Update he.net of ip
	PKGARCH:=all
	DEPENDS:=+luci-proto-ipv6 +ip6tables +odhcpd +odhcp6c
endef

define Package/ipv6helper/description
	IPv6 Helper and Dynamic Update he.net of ip
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/ipv6helper/postinst
endef

define Package/ipv6helper/install
endef


$(eval $(call BuildPackage,ipv6helper))
