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

    public static void saveEpg(Context context, String value) {
        preferences(context).edit().putString("epg_url", safe(value)).apply();
    }

    public static String getEpg(Context context) {
        return preferences(context).getString("epg_url", "");
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

    public static void savePlaylist(Context context, int index, PanelPlaylist playlist) {
        if (index < 1 || index > 5 || playlist == null) {
            return;
        }
        preferences(context).edit()
                .putString("playlist_url_" + index, playlist.getUrl())
                .putString("playlist_name_" + index, playlist.getName())
                .apply();
    }

    public static PanelPlaylist getPlaylist(Context context, int index) {
        if (index < 1 || index > 5) {
            return new PanelPlaylist("", "Lista");
        }
        return new PanelPlaylist(
                preferences(context).getString("playlist_url_" + index, ""),
                preferences(context).getString("playlist_name_" + index, "Lista " + index));
    }

    private static SharedPreferences preferences(Context context) {
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    private static String safe(String value) {
        return value == null ? "" : value.trim();
    }
}
