ARCHS=armv7 armv7s arm64

include theos/makefiles/common.mk

TARGET=clang:7.0

TWEAK_NAME = NoBannerDismiss
NoBannerDismiss_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
