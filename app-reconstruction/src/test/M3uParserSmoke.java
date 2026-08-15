package com.facilitus.app;

public final class M3uParserSmoke {
    public static void main(String[] args) {
        String data = "#EXTM3U\n#EXTINF:-1 group-title=\"Filmes\",Filme A\nhttps://example.invalid/a.m3u8\n#EXTINF:-1 group-title=\"Canais\",Canal B\nhttps://example.invalid/b.m3u8\n";
        if (M3uParser.parse(data).size() != 2) {
            throw new AssertionError("expected 2 M3U entries");
        }
        if (!"Filme A".equals(M3uParser.parse(data).get(0).getTitle())) {
            throw new AssertionError("title parsing failed");
        }
        System.out.println("M3uParserSmoke: PASS");
    }
}
