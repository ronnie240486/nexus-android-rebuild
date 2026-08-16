package com.facilitus.app;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;

/** Minimal XMLTV parser for authorized EPG feeds. */
public final class EpgParser {
    public static final class Program {
        private final String channelId;
        private final String start;
        private final String stop;
        private final String title;
        private final String description;

        public Program(String channelId, String start, String stop, String title, String description) {
            this.channelId = safe(channelId);
            this.start = safe(start);
            this.stop = safe(stop);
            this.title = safe(title);
            this.description = safe(description);
        }

        public String getChannelId() { return channelId; }
        public String getStart() { return start; }
        public String getStop() { return stop; }
        public String getTitle() { return title; }
        public String getDescription() { return description; }

        public String displayLine() {
            String time = start.length() >= 12 ? start.substring(8, 12) : start;
            return time + "  " + title + (channelId.isEmpty() ? "" : "  ·  " + channelId);
        }
    }

    private EpgParser() {}

    public static List<Program> parse(String xml) throws Exception {
        List<Program> programs = new ArrayList<>();
        if (xml == null || xml.trim().isEmpty()) return programs;
        XmlPullParser parser = XmlPullParserFactory.newInstance().newPullParser();
        parser.setInput(new StringReader(xml));
        String channelId = "";
        String start = "";
        String stop = "";
        String title = "";
        String description = "";
        boolean inTitle = false;
        boolean inDesc = false;
        int event;
        while ((event = parser.getEventType()) != XmlPullParser.END_DOCUMENT) {
            if (event == XmlPullParser.START_TAG) {
                String name = parser.getName();
                if ("programme".equals(name)) {
                    channelId = parser.getAttributeValue(null, "channel");
                    start = parser.getAttributeValue(null, "start");
                    stop = parser.getAttributeValue(null, "stop");
                    title = "";
                    description = "";
                } else if ("title".equals(name)) {
                    inTitle = true;
                } else if ("desc".equals(name)) {
                    inDesc = true;
                }
            } else if (event == XmlPullParser.TEXT) {
                if (inTitle) title += parser.getText();
                if (inDesc) description += parser.getText();
            } else if (event == XmlPullParser.END_TAG) {
                String name = parser.getName();
                if ("title".equals(name)) inTitle = false;
                if ("desc".equals(name)) inDesc = false;
                if ("programme".equals(name)) {
                    if (!title.trim().isEmpty()) programs.add(new Program(channelId, start, stop, title.trim(), description.trim()));
                }
            }
            parser.next();
        }
        return programs;
    }

    private static String safe(String value) { return value == null ? "" : value.trim(); }
}
