################################################################################
#
# xdriver_xf86-video-ati
#
################################################################################
#batocera - update
XDRIVER_XF86_VIDEO_ATI_VERSION = 22.0.0
XDRIVER_XF86_VIDEO_ATI_SOURCE = xf86-video-ati-$(XDRIVER_XF86_VIDEO_ATI_VERSION).tar.xz
XDRIVER_XF86_VIDEO_ATI_SITE = http://xorg.freedesktop.org/releases/individual/driver
XDRIVER_XF86_VIDEO_ATI_LICENSE = MIT
XDRIVER_XF86_VIDEO_ATI_LICENSE_FILES = COPYING
XDRIVER_XF86_VIDEO_ATI_DEPENDENCIES = \
	libdrm \
	libgbm \
	xlib_libXcomposite \
	xorgproto \
	xserver_xorg-server

ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGL)$(BR2_PACKAGE_LIBEPOXY),yyy)
XDRIVER_XF86_VIDEO_ATI_CONF_OPTS += --enable-glamor
else
XDRIVER_XF86_VIDEO_ATI_CONF_OPTS += --disable-glamor
endif

# xdriver_xf86-video-ati requires O_CLOEXEC
XDRIVER_XF86_VIDEO_ATI_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"

$(eval $(autotools-package))
