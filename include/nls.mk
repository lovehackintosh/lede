# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2011-2020 OpenWrt.org

# iconv full
ifeq ($(CONFIG_BUILD_NLS),y)
	ICONV_PREFIX:=$(STAGING_DIR)/usr/lib/libiconv-full
	ICONV_FULL:=1

	INTL_PREFIX:=$(STAGING_DIR)/usr/lib/libintl-full
	INTL_FULL:=1

	CMAKE_OPTIONS += -DCMAKE_PREFIX_PATH="$(ICONV_PREFIX);$(INTL_PREFIX)"
else
	ICONV_PREFIX:=
	ICONV_FULL:=

	INTL_PREFIX:=
	INTL_FULL:=
endif

PKG_CONFIG_DEPENDS += CONFIG_BUILD_NLS

ICONV_DEPENDS:=+BUILD_NLS:libiconv-full
ifeq ($(CONFIG_BUILD_NLS),y)
	ICONV_CFLAGS:=-I$(ICONV_PREFIX)/include -Ofast -pipe -march=armv8-a -mtune=cortex-a53 -mcpu=cortex-a53+crypto+crc
	ICONV_CPPFLAGS:=-I$(ICONV_PREFIX)/include -Ofast -pipe -march=armv8-a -mtune=cortex-a53 -mcpu=cortex-a53+crypto+crc
	ICONV_LDFLAGS:=-L$(ICONV_PREFIX)/lib -Wl,-rpath-link=$(ICONV_PREFIX)/lib
else
	ICONV_CFLAGS:=
	ICONV_CPPFLAGS:=
	ICONV_LDFLAGS:=
endif

INTL_DEPENDS:=+BUILD_NLS:libintl-full
ifeq ($(CONFIG_BUILD_NLS),y)
	INTL_CFLAGS:=-I$(INTL_PREFIX)/include -Ofast -pipe -march=armv8-a -mtune=cortex-a53 -mcpu=cortex-a53+crypto+crc
	INTL_CPPFLAGS:=-I$(INTL_PREFIX)/include -Ofast -pipe -march=armv8-a -mtune=cortex-a53 -mcpu=cortex-a53+crypto+crc
	INTL_LDFLAGS:=-L$(INTL_PREFIX)/lib -Wl,-rpath-link=$(INTL_PREFIX)/lib
else
	INTL_CFLAGS:=
	INTL_CPPFLAGS:=
	INTL_LDFLAGS:=
endif

TARGET_CFLAGS += $(ICONV_CFLAGS) $(INTL_CFLAGS)
TARGET_CPPFLAGS += $(ICONV_CPPFLAGS) $(INTL_CPPFLAGS)
TARGET_LDFLAGS += $(ICONV_LDFLAGS) $(INTL_LDFLAGS)
