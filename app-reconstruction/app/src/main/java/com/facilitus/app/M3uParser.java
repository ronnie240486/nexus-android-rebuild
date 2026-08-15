package com.facilitus.app;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/** Small dependency-free M3U parser for authorized panel playlists. */
public final class M3uParser {
    private M3uParser() {
    }

    public static List<Entry> parse(String content) {
        if (content == null || content.trim().isEmpty()) {
            return Collections.emptyList();
        }
        List<Entry> result = new ArrayList<>();
        String pendingName = "";
        String pendingGroup = "";
        for (String raw : content.replace("\r", "").split("\n")) {
            String line = raw.trim();
            if (line.isEmpty() || line.startsWith("#EXTM3U")) {
                continue;
            }
            if (line.startsWith("#EXTINF:")) {
                int comma = line.indexOf(',');
                pendingName = comma >= 0 ? line.substring(comma + 1).trim() : "Sem título";
                pendingGroup = attribute(line, "group-title");
                continue;
            }
            if (!line.startsWith("#")) {
                result.add(new Entry(pendingName.isEmpty() ? line : pendingName, pendingGroup, line));
                pendingName = "";
                pendingGroup = "";
            }
        }
        return result;
    }

    private static String attribute(String line, String name) {
        String prefix = name + "=\"";
        int start = line.indexOf(prefix);
        if (start < 0) {
            return "";
        }
        start += prefix.length();
        int end = line.indexOf('"', start);
        return end > start ? line.substring(start, end) : "";
    }

    public static final class Entry {
        private final String title;
        private final String group;
        private final String url;

        public Entry(String title, String group, String url) {
            this.title = title;
            this.group = group;
            this.url = url;
        }

        public String getTitle() {
            return title;
        }

        public String getGroup() {
            return group;
        }

        public String getUrl() {
            return url;
        }
    }
}
