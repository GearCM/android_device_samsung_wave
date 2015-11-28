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
    public static final String KEY_APPLY = "apply";

    private ListPreference mMdnie;
    private CheckBoxPreference mApply;

    private static SharedPreferences preferences;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        addPreferencesFromResource(R.xml.main);

        preferences = PreferenceManager.getDefaultSharedPreferences(this);

        mMdnie = (ListPreference) findPreference(KEY_MDNIE);
        mMdnie.setEnabled(Mdnie.isSupported());
        mMdnie.setOnPreferenceChangeListener(new Mdnie());

        mApply = (CheckBoxPreference) findPreference(KEY_APPLY);
        mApply.setOnPreferenceChangeListener(new Apply());
   }

    @Override
    protected void onResume() {
        super.onResume();
    }

    @Override
    protected void onPause() {
        super.onPause();
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
