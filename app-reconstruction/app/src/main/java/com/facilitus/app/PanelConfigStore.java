package com.facilitus.app;

import android.content.Context;
import android.content.SharedPreferences;

/** Stores panel-controlled configuration without embedding production hosts or secrets. */
public final class PanelConfigStore {
    private static final String PREFS = "facilitus_panel_config";
    private static final String API = "server_api";

    private PanelConfigStore() {
    }

    public static void saveApi(Context context, String value) {
        preferences(context).edit().putString(API, safe(value)).apply();
    }

    public static String getApi(Context context) {
        return preferences(context).getString(API, "");
    }

    public static void saveServer(Context context, int index, String value) {
        if (index < 1 || index > 5) {
            return;
        }
        preferences(context).edit().putString("server_" + index, safe(value)).apply();
    }

    public static String getServer(Context context, int index) {
        if (index < 1 || index > 5) {
            return "";
        }
        return preferences(context).getString("server_" + index, "");
    }

    private static SharedPreferences preferences(Context context) {
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    private static String safe(String value) {
        return value == null ? "" : value.trim();
    }
}
