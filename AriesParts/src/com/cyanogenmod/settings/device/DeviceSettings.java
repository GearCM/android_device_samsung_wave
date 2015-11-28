package com.cyanogenmod.settings.device;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.preference.CheckBoxPreference;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceCategory;
import android.preference.PreferenceManager;

public class DeviceSettings extends PreferenceActivity  {

    public static final String KEY_MDNIE = "mdnie";
    public static final String KEY_HSPA = "hspa";
    public static final String KEY_HSPA_CATEGORY = "category_radio";
    public static final String KEY_VOLUME_BOOST = "volume_boost";
    public static final String KEY_VOLUME_CATEGORY = "category_volume_boost";
    public static final String KEY_CARDOCK_AUDIO = "cardock_audio";
    public static final String KEY_DESKDOCK_AUDIO = "deskdock_audio";
    public static final String KEY_DOCK_AUDIO_CATEGORY = "category_dock_audio";
    public static final String KEY_WIFI_SPEED = "wifi_speed";
    public static final String KEY_WIFI_CATEGORY = "category_wifi";
    public static final String KEY_FAST_CHARGE = "fast_charge";
    public static final String KEY_CHARGE_CATEGORY = "category_charge";
    public static final String KEY_RAM_CATEGORY = "category_ram";
    public static final String KEY_LOWRAM = "lowram";
    public static final String KEY_APPLY = "apply";

    private ListPreference mMdnie;
    private ListPreference mHspa;
    private VolumeBoostPreference mVolumeBoost;
    private CheckBoxPreference mCarDockAudio;
    private CheckBoxPreference mDeskDockAudio;
    private CheckBoxPreference mWifiSpeed;
    private CheckBoxPreference mFastCharge;
    private CheckBoxPreference mLowram;
    private CheckBoxPreference mApply;

    private static SharedPreferences preferences;

    private BroadcastReceiver mHeadsetReceiver = new BroadcastReceiver() {

        @Override
        public void onReceive(Context context, Intent intent) {
            int state = intent.getIntExtra("state", 0);
        }

    };

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        addPreferencesFromResource(R.xml.main);

        preferences = PreferenceManager.getDefaultSharedPreferences(this);

        mMdnie = (ListPreference) findPreference(KEY_MDNIE);
        mMdnie.setEnabled(Mdnie.isSupported());
        mMdnie.setOnPreferenceChangeListener(new Mdnie());

        mHspa = (ListPreference) findPreference(KEY_HSPA);
        if (Hspa.isSupported()) {
           mHspa.setOnPreferenceChangeListener(new Hspa(this));
        } else {
           PreferenceCategory category = (PreferenceCategory) getPreferenceScreen().findPreference(KEY_HSPA_CATEGORY);
           category.removePreference(mHspa);
           getPreferenceScreen().removePreference(category);
        }

        mVolumeBoost = (VolumeBoostPreference) findPreference(KEY_VOLUME_BOOST);
        if (!VolumeBoostPreference.isSupported()) {
            PreferenceCategory category = (PreferenceCategory) getPreferenceScreen().findPreference(KEY_VOLUME_CATEGORY);
            category.removePreference(mVolumeBoost);
            getPreferenceScreen().removePreference(category);
        }

        mCarDockAudio = (CheckBoxPreference) findPreference(KEY_CARDOCK_AUDIO);
        mDeskDockAudio = (CheckBoxPreference) findPreference(KEY_DESKDOCK_AUDIO);
        if (DockAudio.isSupported()) {
            mCarDockAudio.setOnPreferenceChangeListener(new DockAudio());
            mDeskDockAudio.setOnPreferenceChangeListener(new DockAudio());
        } else {
            PreferenceCategory category = (PreferenceCategory) getPreferenceScreen().findPreference(KEY_DOCK_AUDIO_CATEGORY);
            category.removePreference(mCarDockAudio);
            category.removePreference(mDeskDockAudio);
            getPreferenceScreen().removePreference(category);
        }

        mWifiSpeed = (CheckBoxPreference) findPreference(KEY_WIFI_SPEED);
        if (Wifi.isSupported()) {
            mWifiSpeed.setOnPreferenceChangeListener(new Wifi());
        } else {
            PreferenceCategory category = (PreferenceCategory) getPreferenceScreen().findPreference(KEY_WIFI_CATEGORY);
            category.removePreference(mWifiSpeed);
            getPreferenceScreen().removePreference(category);
        }

        mFastCharge = (CheckBoxPreference) findPreference(KEY_FAST_CHARGE);
        if (Charge.isSupported()) {
            mFastCharge.setOnPreferenceChangeListener(new Charge());
        } else {
            PreferenceCategory category = (PreferenceCategory) getPreferenceScreen().findPreference(KEY_CHARGE_CATEGORY);
            category.removePreference(mFastCharge);
            getPreferenceScreen().removePreference(category);
        }

        mLowram = (CheckBoxPreference) findPreference(KEY_LOWRAM);
        if (Ram.isSupported()) {
            mLowram.setOnPreferenceChangeListener(new Ram());
        } else {
            PreferenceCategory category = (PreferenceCategory) getPreferenceScreen().findPreference(KEY_RAM_CATEGORY);
            category.removePreference(mLowram);
            getPreferenceScreen().removePreference(category);
        }

        mApply = (CheckBoxPreference) findPreference(KEY_APPLY);
        mApply.setOnPreferenceChangeListener(new Apply());
   }

    @Override
    protected void onResume() {
        super.onResume();
        registerReceiver(mHeadsetReceiver, new IntentFilter(Intent.ACTION_HEADSET_PLUG));
    }

    @Override
    protected void onPause() {
        super.onPause();
        unregisterReceiver(mHeadsetReceiver);
    }


    public static void setPreferenceString(String key, String value) {
	Editor ed = preferences.edit();
	ed.putString(key, value);
	ed.commit();
    }

    public static void setPreferenceInteger(String key, int value) {
	Editor ed = preferences.edit();
	ed.putInt(key, value);
	ed.commit();
    }

    public static void setPreferenceBoolean(String key, boolean value) {
	Editor ed = preferences.edit();
	ed.putBoolean(key, value);
	ed.commit();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
    }

}
