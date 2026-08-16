package com.facilitus.app;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Playlist contract expected from the authorized panel. */
public final class PanelPlaylist {
    private static final Pattern OBJECT = Pattern.compile("\\{([^{}]*)}");
    private static final Pattern URL = Pattern.compile("\\\"playlist_url\\\"\\s*:\\s*\\\"([^\\\"]*)\\\"");
    private static final Pattern NAME = Pattern.compile("\\\"playlist_name\\\"\\s*:\\s*\\\"([^\\\"]*)\\\"");

    private final String url;
    private final String name;

    public PanelPlaylist(String url, String name) {
        this.url = url == null ? "" : url.trim();
        this.name = name == null || name.trim().isEmpty() ? "Lista" : name.trim();
    }

    public String getUrl() {
        return url;
    }

    public String getName() {
        return name;
    }

    public static List<PanelPlaylist> parseJson(String json) {
        List<PanelPlaylist> result = new ArrayList<>();
        if (json == null || json.trim().isEmpty()) {
            return result;
        }
        Matcher objects = OBJECT.matcher(json);
        while (objects.find()) {
            String object = objects.group(1);
            Matcher url = URL.matcher(object);
            if (!url.find()) {
                continue;
            }
            Matcher name = NAME.matcher(object);
            result.add(new PanelPlaylist(url.group(1), name.find() ? name.group(1) : "Lista"));
        }
        if (result.isEmpty()) {
            Matcher url = URL.matcher(json);
            if (url.find()) {
                Matcher name = NAME.matcher(json);
                result.add(new PanelPlaylist(url.group(1), name.find() ? name.group(1) : "Lista"));
            }
        }
        return result;
    }
}
