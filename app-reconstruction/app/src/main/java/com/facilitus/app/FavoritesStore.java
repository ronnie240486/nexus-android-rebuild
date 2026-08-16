package com.facilitus.app;

import android.content.Context;
import android.content.SharedPreferences;

import java.util.ArrayList;
import java.util.List;

public final class FavoritesStore {
    private static final String PREFS = "facilitus_favorites";
    private static final String ITEMS = "items";

    public static final class Item {
        public final String title;
        public final String url;
        public Item(String title, String url) { this.title = safe(title); this.url = safe(url); }
    }

    private FavoritesStore() {}

    public static void add(Context context, String title, String url) {
        List<Item> items = get(context);
        for (Item item : items) if (item.title.equals(title) && item.url.equals(url)) return;
        items.add(new Item(title, url));
        save(context, items);
    }

    public static List<Item> get(Context context) {
        String raw = prefs(context).getString(ITEMS, "");
        List<Item> result = new ArrayList<>();
        if (raw.isEmpty()) return result;
        for (String line : raw.split("\\n")) {
            int divider = line.indexOf('|');
            if (divider > 0) result.add(new Item(line.substring(0, divider), line.substring(divider + 1)));
        }
        return result;
    }

    public static void clear(Context context) { prefs(context).edit().remove(ITEMS).apply(); }

    private static void save(Context context, List<Item> items) {
        StringBuilder value = new StringBuilder();
        for (Item item : items) {
            if (value.length() > 0) value.append('\n');
            value.append(item.title.replace("|", " ")).append('|').append(item.url.replace("|", " "));
        }
        prefs(context).edit().putString(ITEMS, value.toString()).apply();
    }

    private static SharedPreferences prefs(Context context) { return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE); }
    private static String safe(String value) { return value == null ? "" : value.trim(); }
}
