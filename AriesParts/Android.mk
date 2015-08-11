LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := $(call all-java-files-under, src)

LOCAL_PACKAGE_NAME := AriesParts
LOCAL_CERTIFICATE := platform

LOCAL_OVERRIDES_PACKAGES := VoicePlus libemoji CMUpdater CMAccount CMHome Superuser su CellBroadcastReceiver WhisperPush BasicDreams CMWallpapers ThemeChooser ThemesProvider

# Required so that symbols used by the jni library doesn't get stripped out
LOCAL_PROGUARD_ENABLED := disabled

include $(BUILD_PACKAGE)

include $(call all-makefiles-under,$(LOCAL_PATH))
