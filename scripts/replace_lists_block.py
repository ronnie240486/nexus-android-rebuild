from pathlib import Path
import sys

path = Path(sys.argv[1])
text = path.read_text()
start = text.index('    private void showLists() {')
end = text.index('    private void showAccount() {', start)
replacement = '''    private void showLists() {
        LinearLayout root = moduleRoot("Minhas listas", "Listas privadas vinculadas ao identificador do aparelho");
        TextView syncStatus = text("As listas são privadas e controladas pelo painel.", 14, MUTED);
        root.addView(syncStatus, params(0, 0, 0, 14));
        for (int index = 1; index <= 5; index++) {
            final int slot = index;
            PanelPlaylist playlist = PanelConfigStore.getPlaylist(this, index);
            String label = playlist.getName().isEmpty() ? "Lista " + index : playlist.getName();
            Button item = button(label + (playlist.getUrl().isEmpty() ? "  ·  não configurada" : "  ·  sincronizar"), WHITE);
            item.setOnClickListener(v -> syncPlaylist(slot, syncStatus));
            root.addView(item, params(0, 0, 0, 9));
        }
        EditText json = input("Cole a resposta JSON do painel com playlist_url e playlist_name");
        json.setMinLines(3);
        json.setSingleLine(false);
        root.addView(json, params(0, 12, 0, 10));
        Button importJson = button("Importar playlists do painel", GOLD);
        importJson.setOnClickListener(v -> {
            List<PanelPlaylist> playlists = PanelPlaylist.parseJson(json.getText().toString());
            int count = Math.min(playlists.size(), 5);
            for (int index = 0; index < count; index++) {
                PanelConfigStore.savePlaylist(this, index + 1, playlists.get(index));
            }
            syncStatus.setText(count == 0 ? "Nenhuma playlist válida encontrada." : count + " playlists importadas.");
            syncStatus.setTextColor(count == 0 ? ERROR : CYAN);
        });
        root.addView(importJson, params(0, 0, 0, 0));
        setPage(root);
    }

    private void syncPlaylist(int slot, TextView statusView) {
        PanelPlaylist playlist = PanelConfigStore.getPlaylist(this, slot);
        String endpoint = playlist.getUrl();
        if (endpoint.isEmpty()) {
            endpoint = PanelConfigStore.getServer(this, slot);
        }
        if (endpoint.isEmpty()) {
            statusView.setText("Configure a URL da lista " + slot + " no painel.");
            statusView.setTextColor(ERROR);
            return;
        }
        statusView.setText("Sincronizando " + playlist.getName() + "...");
        statusView.setTextColor(GOLD);
        new Thread(() -> {
            HttpURLConnection connection = null;
            try {
                URL url = new URL(endpoint);
                connection = (HttpURLConnection) url.openConnection();
                connection.setConnectTimeout(10000);
                connection.setReadTimeout(15000);
                connection.setRequestProperty("User-Agent", "Facilitus/0.6.0");
                int code = connection.getResponseCode();
                if (code < 200 || code >= 300) {
                    throw new IllegalStateException("HTTP " + code);
                }
                StringBuilder body = new StringBuilder();
                try (BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"))) {
                    String line;
                    while ((line = reader.readLine()) != null) {
                        body.append(line).append('\\n');
                    }
                }
                List<M3uParser.Entry> parsed = M3uParser.parse(body.toString());
                currentEntries.clear();
                currentEntries.addAll(parsed);
                int count = parsed.size();
                runOnUiThread(() -> {
                    statusView.setText("Lista sincronizada: " + count + " itens encontrados.");
                    statusView.setTextColor(CYAN);
                });
            } catch (Exception error) {
                runOnUiThread(() -> {
                    statusView.setText("Falha ao sincronizar: " + error.getClass().getSimpleName());
                    statusView.setTextColor(ERROR);
                });
            } finally {
                if (connection != null) {
                    connection.disconnect();
                }
            }
        }).start();
    }

'''
path.write_text(text[:start] + replacement + text[end:])
print('replaced lists block')
