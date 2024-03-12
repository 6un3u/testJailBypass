# THEOS_DEVICE_IP = 192.168.50.90
THEOS_DEVICE_IP = 10.21.3.53
TARGET := iphone:clang:latest:7.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = TestJailBypass

TestJailBypass_CFLAGS = -fobjc-arc
$(TWEAK_NAME)_FILES = Tweaks/JailPattern.x Tweaks/Tweak.x Tweaks/ObjCHooks.x

include $(THEOS_MAKE_PATH)/tweak.mk
