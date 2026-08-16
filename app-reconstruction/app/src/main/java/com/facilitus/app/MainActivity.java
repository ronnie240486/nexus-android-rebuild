package com.facilitus.app;

import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.Typeface;
import android.media.MediaPlayer;
import android.net.Uri;
import android.os.Bundle;
import android.text.InputType;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.Toast;
import android.widget.VideoView;
import android.widget.LinearLayout;
import android.widget.MediaController;
import android.widget.ScrollView;
import android.widget.TextView;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Deque;
import java.util.List;

/** Clean manual reconstruction of the functional shell observed in NEXUS. */
public final class MainActivity extends Activity {
    private static final int NAVY = Color.rgb(5, 8, 43);
    private static final int PANEL = Color.rgb(13, 19, 62);
    private static final int CYAN = Color.rgb(18, 217, 228);
    private static final int GOLD = Color.rgb(242, 182, 61);
    private static final int WHITE = Color.rgb(245, 248, 255);
    private static final int MUTED = Color.rgb(190, 202, 228);
    private static final int ERROR = Color.rgb(255, 151, 151);
    private static final String PREFS = "facilitus_session";
    private static final String ACTIVE = "active";

    private final Deque<String> history = new ArrayDeque<>();
    private DeviceIdentity.Snapshot identity;
    private final List<M3uParser.Entry> currentEntries = new ArrayList<>();
    private TextView status;
    private LinearLayout content;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getWindow().setStatusBarColor(NAVY);
        getWindow().setNavigationBarColor(NAVY);
        identity = DeviceIdentity.read(this);
        if (getSharedPreferences(PREFS, MODE_PRIVATE).getBoolean(ACTIVE, false)) {
            showHome();
        } else {
            showWelcome();
        }
    }

    @Override
    public void onBackPressed() {
        if (!history.isEmpty()) {
            history.pop();
            showHome();
        } else if (getSharedPreferences(PREFS, MODE_PRIVATE).getBoolean(ACTIVE, false)) {
            showHome();
        } else {
            super.onBackPressed();
        }
    }

    private void showWelcome() {
        history.clear();
        LinearLayout root = pageRoot();
        root.setPadding(28, 24, 28, 28);
        addLogo(root, 150);
        addTitle(root, "Bem-vindo ao Facilitus");
        addParagraph(root, "Este é o acesso do seu aparelho. Copie o identificador de 12 dígitos para o painel e libere as listas deste usuário.");

        LinearLayout card = card();
        addLabel(card, "IDENTIFICADOR DO APARELHO");
        TextView value = text(identity.getDisplayValue(), 26, CYAN);
        value.setTypeface(Typeface.MONOSPACE, Typeface.BOLD);
        value.setGravity(Gravity.CENTER);
        value.setTextIsSelectable(true);
        card.addView(value, params(0, 0, 0, 5));
        TextView source = text(identity.getSource(), 13, MUTED);
        source.setGravity(Gravity.CENTER);
        card.addView(source, params(0, 0, 0, 12));
        Button copy = button("Copiar identificador", CYAN);
        copy.setOnClickListener(v -> copyIdentity());
        card.addView(copy, params(0, 0, 0, 0));
        root.addView(card, params(0, 0, 0, 16));

        addLabel(root, "STATUS DA ATIVAÇÃO");
        status = text("Copie o identificador, cadastre-o no painel e depois verifique a liberação.", 14, MUTED);
        status.setGravity(Gravity.CENTER);
        root.addView(status, params(0, 0, 0, 12));

        Button validate = button("Verificar liberação no painel", WHITE);
        validate.setOnClickListener(v -> {
            validate.setEnabled(false);
            status.setText("Consultando o painel...");
            status.setTextColor(GOLD);
            ActivationClient.validate(PanelConfigStore.getApi(this), identity.getPanelValue(), (active, message) -> {
                validate.setEnabled(true);
                status.setText(message);
                status.setTextColor(active ? CYAN : ERROR);
                if (active) {
                    getSharedPreferences(PREFS, MODE_PRIVATE).edit().putBoolean(ACTIVE, true).apply();
                    showHome();
                }
            });
        });
        root.addView(validate, params(0, 0, 0, 10));

        Button refresh = button("Atualizar identificador", GOLD);
        refresh.setOnClickListener(v -> {
            identity = DeviceIdentity.read(this);
            status.setText("Identificador atual: " + identity.getDisplayValue());
            status.setTextColor(CYAN);
        });
        root.addView(refresh, params(0, 0, 0, 0));
        setPage(root);
    }

    private void showHome() {
        history.clear();
        LinearLayout root = pageRoot();
        root.setPadding(24, 18, 24, 24);
        addLogo(root, 92);
        addTitle(root, "Facilitus");
        TextView privateNote = text("Lista privada vinculada ao aparelho " + identity.getDisplayValue(), 13, MUTED);
        privateNote.setGravity(Gravity.CENTER);
        root.addView(privateNote, params(0, 0, 0, 16));

        LinearLayout grid = column();
        addMenuButton(grid, "Filmes", "vod");
        addMenuButton(grid, "Séries e episódios", "series");
        addMenuButton(grid, "Canais ao vivo", "live");
        addMenuButton(grid, "EPG / programação", "epg");
        addMenuButton(grid, "Buscar", "search");
        addMenuButton(grid, "Favoritos", "favorites");
        addMenuButton(grid, "Minhas listas", "lists");
        addMenuButton(grid, "Login e conta", "account");
        addMenuButton(grid, "Servidor", "server");
        addMenuButton(grid, "Aplicativos recomendados", "apps");
        addMenuButton(grid, "Compras e recargas", "purchases");
        addMenuButton(grid, "Eventos esportivos", "sports");
        addMenuButton(grid, "Web e artigos", "web");
        addMenuButton(grid, "Reservas", "reservations");
        addMenuButton(grid, "Downloads", "downloads");
        addMenuButton(grid, "Customização", "customization");
        addMenuButton(grid, "Configurações", "settings");
        addMenuButton(grid, "Sobre o Facilitus", "about");
        root.addView(grid, params(0, 0, 0, 0));
        setPage(root);
    }

    private void addMenuButton(LinearLayout parent, String label, String route) {
        Button button = button(label, route.equals("settings") ? GOLD : WHITE);
        button.setOnClickListener(v -> navigate(route));
        parent.addView(button, params(0, 0, 0, 9));
    }

    private void navigate(String route) {
        history.push(route);
        switch (route) {
            case "vod": showVod(); break;
            case "series": showSeries(); break;
            case "live": showLive(); break;
            case "epg": showEpg(); break;
            case "search": showSearch(); break;
            case "favorites": showFavorites(); break;
            case "lists": showLists(); break;
            case "account": showAccount(); break;
            case "server": showServer(); break;
            case "apps": showApps(); break;
            case "purchases": showPurchases(); break;
            case "sports": showSports(); break;
            case "web": showWeb(); break;
            case "reservations": showReservations(); break;
            case "downloads": showDownloads(); break;
            case "customization": showCustomization(); break;
            case "settings": showSettings(); break;
            case "about": showAbout(); break;
            default: showHome(); break;
        }
    }

    private void showVod() {
        if (!currentEntries.isEmpty()) {
            showStreamingCatalog("Filmes", "Itens VOD recebidos da lista privada", false);
        } else {
            showCatalog("Filmes", "Catálogo de filmes", new String[]{"Destaques", "Ação", "Comédia", "Drama", "Documentários"});
        }
    }

    private void showSeries() {
        if (!currentEntries.isEmpty()) {
            showStreamingCatalog("Séries e episódios", "Itens de séries recebidos da lista privada", true);
        } else {
            showCatalog("Séries e episódios", "Séries vinculadas às listas privadas", new String[]{"Em destaque", "Novas temporadas", "Mais assistidas", "Infantil"});
        }
    }

    private void showStreamingCatalog(String title, String subtitle, boolean series) {
        LinearLayout root = moduleRoot(title, subtitle);
        int shown = 0;
        for (M3uParser.Entry entry : currentEntries) {
            String group = entry.getGroup().toLowerCase();
            boolean looksSeries = group.contains("series") || group.contains("série") || group.contains("temporada") || entry.getTitle().toLowerCase().contains("s0");
            if (series != looksSeries) {
                continue;
            }
            Button item = button(entry.getTitle() + "  ·  Abrir", WHITE);
            item.setOnClickListener(v -> showDetails(entry.getTitle(), entry.getUrl()));
            root.addView(item, params(0, 0, 0, 9));
            shown++;
            if (shown >= 80) {
                break;
            }
        }
        if (shown == 0) {
            root.addView(text("Nenhum item desta categoria foi encontrado na lista sincronizada.", 16, MUTED), params(0, 0, 0, 18));
        }
        setPage(root);
    }

    private void showCatalog(String title, String subtitle, String[] categories) {
        LinearLayout root = moduleRoot(title, subtitle);
        for (String category : categories) {
            LinearLayout item = card();
            TextView name = text(category, 19, WHITE);
            name.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
            item.addView(name, params(0, 0, 0, 5));
            item.addView(text("Sincronize uma lista autorizada para exibir o catálogo real.", 14, MUTED), params(0, 0, 0, 10));
            Button open = button("Abrir categoria", CYAN);
            open.setOnClickListener(v -> showDetails(category));
            item.addView(open, params(0, 0, 0, 0));
            root.addView(item, params(0, 0, 0, 10));
        }
        setPage(root);
    }

    private void showDetails(String title) {
        showDetails(title, "");
    }

    private void showDetails(String title, String url) {
        LinearLayout root = moduleRoot(title, "Detalhes do conteúdo");
        root.addView(text("Sinopse, capa, temporadas, episódios e ações de reprodução serão carregadas da fonte autorizada.", 16, MUTED), params(0, 0, 0, 18));
        Button play = button("Reproduzir", CYAN);
        play.setOnClickListener(v -> showPlayer(title, url));
        root.addView(play, params(0, 0, 0, 10));
        Button favorite = button("Adicionar aos favoritos", GOLD);
        favorite.setOnClickListener(v -> toast("Adicionado aos favoritos"));
        root.addView(favorite, params(0, 0, 0, 0));
        setPage(root);
    }

    private void showPlayer(String title) {
        showPlayer(title, "");
    }

    private void showPlayer(String title, String initialUrl) {
        LinearLayout root = moduleRoot("Player", title);
        VideoView player = new VideoView(this);
        player.setBackgroundColor(Color.BLACK);
        MediaController controller = new MediaController(this);
        controller.setAnchorView(player);
        player.setMediaController(controller);
        root.addView(player, params(0, 0, 0, 12, 280));
        EditText url = input("URL direta do vídeo ou HLS (.m3u8)");
        url.setText(initialUrl);
        root.addView(url, params(0, 0, 0, 10));
        TextView statusView = text("Informe uma URL autorizada para iniciar a reprodução.", 14, MUTED);
        root.addView(statusView, params(0, 0, 0, 10));
        player.setOnErrorListener((mp, what, extra) -> {
            statusView.setText("Falha ao reproduzir: código " + what + "/" + extra);
            statusView.setTextColor(ERROR);
            return true;
        });
        Button play = button("Reproduzir", CYAN);
        play.setOnClickListener(v -> {
            String value = url.getText().toString().trim();
            if (value.isEmpty()) {
                statusView.setText("Informe a URL do conteúdo.");
                statusView.setTextColor(ERROR);
                return;
            }
            try {
                player.setVideoURI(Uri.parse(value));
                player.start();
                statusView.setText("Reprodução iniciada.");
                statusView.setTextColor(CYAN);
            } catch (Exception error) {
                statusView.setText(error.getClass().getSimpleName() + ": " + error.getMessage());
                statusView.setTextColor(ERROR);
            }
        });
        root.addView(play, params(0, 0, 0, 10));
        Button back = button("Voltar ao conteúdo", WHITE);
        back.setOnClickListener(v -> showDetails(title));
        root.addView(back, params(0, 0, 0, 0));
        setPage(root);
    }

    private void showLive() {
        LinearLayout root = moduleRoot("Canais ao vivo", "Categorias e fontes do painel");
        if (!currentEntries.isEmpty()) {
            int shown = 0;
            for (M3uParser.Entry entry : currentEntries) {
                String group = entry.getGroup().toLowerCase();
                if (group.contains("live") || group.contains("canal") || group.contains("tv") || group.isEmpty()) {
                    Button item = button(entry.getTitle() + "  ·  Abrir canal", WHITE);
                    item.setOnClickListener(v -> showPlayer(entry.getTitle(), entry.getUrl()));
                    root.addView(item, params(0, 0, 0, 9));
                    shown++;
                    if (shown >= 40) {
                        break;
                    }
                }
            }
        } else {
            String[] channels = {"Notícias", "Esportes", "Filmes", "Infantil", "Variedades"};
            for (String channel : channels) {
                Button item = button(channel + "  ·  Abrir canal", WHITE);
                item.setOnClickListener(v -> showPlayer(channel));
                root.addView(item, params(0, 0, 0, 9));
            }
        }
        Button reload = button("Atualizar lista ao vivo", GOLD);
        reload.setOnClickListener(v -> toast("Atualização solicitada ao painel"));
        root.addView(reload, params(0, 12, 0, 0));
        setPage(root);
    }

    private void showEpg() {
        LinearLayout root = moduleRoot("EPG / programação", "Grade de programação por canal");
        String[] entries = {"18:00  Jornal da noite", "19:30  Filme em destaque", "21:15  Série principal", "22:00  Programa especial"};
        for (String entry : entries) {
            root.addView(text(entry, 17, WHITE), params(0, 10, 0, 10));
        }
        root.addView(text("A grade real será carregada do EPG autorizado do painel.", 14, MUTED), params(0, 12, 0, 0));
        setPage(root);
    }

    private void showSearch() {
        LinearLayout root = moduleRoot("Buscar", "Pesquisa de filmes, séries e canais");
        EditText query = input("Digite o nome do conteúdo");
        root.addView(query, params(0, 0, 0, 10));
        Button search = button("Pesquisar", CYAN);
        LinearLayout results = column();
        search.setOnClickListener(v -> {
            results.removeAllViews();
            String term = query.getText().toString().trim().toLowerCase();
            if (term.isEmpty()) {
                results.addView(text("Digite um termo para pesquisar.", 15, ERROR), params(0, 0, 0, 0));
                return;
            }
            int matches = 0;
            for (M3uParser.Entry entry : currentEntries) {
                if (entry.getTitle().toLowerCase().contains(term)) {
                    Button item = button(entry.getTitle() + "  ·  Abrir", WHITE);
                    item.setOnClickListener(x -> showDetails(entry.getTitle(), entry.getUrl()));
                    results.addView(item, params(0, 0, 0, 8));
                    matches++;
                    if (matches >= 60) break;
                }
            }
            if (matches == 0) {
                results.addView(text("Nenhum resultado encontrado na lista sincronizada.", 15, MUTED), params(0, 0, 0, 0));
            }
        });
        root.addView(search, params(0, 0, 0, 16));
        root.addView(results, params(0, 0, 0, 0));
        setPage(root);
    }

    private void showFavorites() {
        LinearLayout root = moduleRoot("Favoritos", "Conteúdos salvos pelo usuário");
        root.addView(text("Nenhum favorito sincronizado ainda.", 16, MUTED), params(0, 0, 0, 18));
        Button add = button("Voltar ao catálogo", WHITE);
        add.setOnClickListener(v -> showVod());
        root.addView(add, params(0, 0, 0, 0));
        setPage(root);
    }

    private void showLists() {
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
        String endpointValue = playlist.getUrl();
        if (endpointValue.isEmpty()) {
            endpointValue = PanelConfigStore.getServer(this, slot);
        }
        final String endpoint = endpointValue;
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
                        body.append(line).append('\n');
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

    private void showAccount() {
        LinearLayout root = moduleRoot("Login e conta", "Sessão, cadastro e recuperação de acesso");
        addLabel(root, "USUÁRIO");
        EditText username = input("Nome de usuário");
        root.addView(username, params(0, 0, 0, 9));
        EditText password = input("Senha");
        password.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_PASSWORD);
        root.addView(password, params(0, 0, 0, 12));
        Button login = button("Entrar", CYAN);
        login.setOnClickListener(v -> toast("Login será conectado ao painel autorizado"));
        root.addView(login, params(0, 0, 0, 9));
        Button register = button("Cadastrar usuário", WHITE);
        register.setOnClickListener(v -> toast("Cadastro de usuário disponível no painel"));
        root.addView(register, params(0, 0, 0, 9));
        Button forgot = button("Esqueci minha senha", GOLD);
        forgot.setOnClickListener(v -> toast("Fluxo de recuperação solicitado"));
        root.addView(forgot, params(0, 0, 0, 0));
        setPage(root);
    }

    private void showServer() {
        LinearLayout root = moduleRoot("Servidor", "Configuração equivalente à tela ServerAddressSettingActivity");
        addLabel(root, "API DO SERVIDOR");
        EditText api = input("API do Servidor");
        api.setText(PanelConfigStore.getApi(this));
        root.addView(api, params(0, 0, 0, 12));
        addLabel(root, "ENDPOINTS DISPONÍVEIS");
        EditText[] endpoints = new EditText[5];
        for (int index = 1; index <= 5; index++) {
            endpoints[index - 1] = input("Servidor " + index);
            endpoints[index - 1].setText(PanelConfigStore.getServer(this, index));
            root.addView(endpoints[index - 1], params(0, 0, 0, 8));
        }
        Button save = button("Salvar servidores", GOLD);
        save.setOnClickListener(v -> {
            PanelConfigStore.saveApi(this, api.getText().toString());
            for (int index = 1; index <= 5; index++) {
                PanelConfigStore.saveServer(this, index, endpoints[index - 1].getText().toString());
            }
            toast("Servidores salvos localmente");
        });
        root.addView(save, params(0, 8, 0, 0));
        setPage(root);
    }

    private void showApps() {
        LinearLayout root = moduleRoot("Aplicativos recomendados", "Área equivalente ao catálogo de aplicativos");
        String[] apps = {"Facilitus Player", "Facilitus TV", "Facilitus Kids", "Facilitus Web"};
        for (String app : apps) {
            Button item = button(app + "  ·  Detalhes", WHITE);
            item.setOnClickListener(v -> toast("Download será disponibilizado pelo painel"));
            root.addView(item, params(0, 0, 0, 9));
        }
        setPage(root);
    }

    private void showPurchases() {
        LinearLayout root = moduleRoot("Compras e recargas", "Área de pagamentos e pacotes do usuário");
        String[] options = {"Ativar conta", "Comprar pacote", "Ver histórico", "Consultar vencimento"};
        for (String option : options) {
            Button item = button(option, WHITE);
            item.setOnClickListener(v -> toast("Ação encaminhada ao painel autorizado"));
            root.addView(item, params(0, 0, 0, 9));
        }
        setPage(root);
    }

    private void showSports() {
        LinearLayout root = moduleRoot("Eventos esportivos", "Partidas, tabelas e programação esportiva");
        String[] items = {"Ao vivo agora", "Próximas partidas", "Tabela de campeonatos", "Resultados"};
        for (String itemValue : items) {
            Button item = button(itemValue, WHITE);
            item.setOnClickListener(v -> toast("Conteúdo esportivo será sincronizado pelo painel"));
            root.addView(item, params(0, 0, 0, 9));
        }
        setPage(root);
    }

    private void showWeb() {
        LinearLayout root = moduleRoot("Web e artigos", "Conteúdo editorial e páginas personalizadas");
        root.addView(text("A área WebView do original será conectada a fontes autorizadas, com navegação segura e botão de retorno.", 16, MUTED), params(0, 0, 0, 18));
        Button open = button("Abrir conteúdo", CYAN);
        open.setOnClickListener(v -> toast("Conteúdo Web aguardando configuração do painel"));
        root.addView(open, params(0, 0, 0, 0));
        setPage(root);
    }

    private void showReservations() {
        LinearLayout root = moduleRoot("Reservas", "Serviços e reservas personalizados");
        root.addView(text("Nenhuma reserva encontrada para este aparelho.", 16, MUTED), params(0, 0, 0, 16));
        Button newReservation = button("Nova reserva", GOLD);
        newReservation.setOnClickListener(v -> toast("Formulário de reserva será aberto pelo painel"));
        root.addView(newReservation, params(0, 0, 0, 0));
        setPage(root);
    }

    private void showDownloads() {
        LinearLayout root = moduleRoot("Downloads", "Tarefas e arquivos locais");
        root.addView(text("Nenhum download em andamento.", 16, MUTED), params(0, 0, 0, 16));
        Button clear = button("Limpar histórico", GOLD);
        clear.setOnClickListener(v -> toast("Histórico limpo"));
        root.addView(clear, params(0, 0, 0, 0));
        setPage(root);
    }

    private void showCustomization() {
        LinearLayout root = moduleRoot("Customização", "Nome, fundo e logo do aplicativo");
        addLabel(root, "APARÊNCIA");
        root.addView(text("Logo Facilitus\nFundo azul-marinho\nAcentos ciano e dourado", 17, WHITE), params(0, 0, 0, 18));
        Button background = button("Escolher imagem de fundo", WHITE);
        background.setOnClickListener(v -> toast("Seleção de fundo será conectada ao painel"));
        root.addView(background, params(0, 0, 0, 9));
        Button logo = button("Alterar logo", GOLD);
        logo.setOnClickListener(v -> toast("Logo será atualizado pelo painel"));
        root.addView(logo, params(0, 0, 0, 0));
        setPage(root);
    }

    private void showSettings() {
        LinearLayout root = moduleRoot("Configurações", "Preferências do Facilitus");
        addLabel(root, "SERVIDOR PRINCIPAL");
        EditText server = input("https://seu-servidor-autorizado");
        root.addView(server, params(0, 0, 0, 10));
        Button save = button("Salvar servidor", GOLD);
        save.setOnClickListener(v -> toast("Servidor salvo localmente"));
        root.addView(save, params(0, 0, 0, 14));
        addLabel(root, "PLAYER");
        root.addView(text("Decodificação automática\nPlayer externo\nFonte preferida\nReprodução automática", 16, WHITE), params(0, 0, 0, 18));
        Button language = button("Idioma", WHITE);
        language.setOnClickListener(v -> toast("Seleção de idioma disponível na próxima etapa"));
        root.addView(language, params(0, 0, 0, 9));
        Button reset = button("Sair e limpar ativação", ERROR);
        reset.setOnClickListener(v -> {
            getSharedPreferences(PREFS, MODE_PRIVATE).edit().clear().apply();
            showWelcome();
        });
        root.addView(reset, params(0, 0, 0, 0));
        setPage(root);
    }

    private void showAbout() {
        LinearLayout root = moduleRoot("Sobre o Facilitus", "Aplicativo de mídia conectado a listas autorizadas");
        root.addView(text("Facilitus\nVersão de reconstrução manual 0.3.0\n\nEste aplicativo não fornece mídia própria. O conteúdo depende das listas e fontes autorizadas configuradas no painel.", 16, WHITE), params(0, 0, 0, 20));
        Button license = button("Política e permissões", WHITE);
        license.setOnClickListener(v -> toast("Políticas serão exibidas na próxima etapa"));
        root.addView(license, params(0, 0, 0, 0));
        setPage(root);
    }

    private LinearLayout moduleRoot(String title, String subtitle) {
        if (!history.isEmpty()) {
            history.pop();
        }
        LinearLayout root = pageRoot();
        root.setPadding(24, 18, 24, 24);
        addLogo(root, 76);
        addTitle(root, title);
        addParagraph(root, subtitle);
        Button back = button("Voltar para a Home", GOLD);
        back.setOnClickListener(v -> showHome());
        root.addView(back, params(0, 0, 0, 18));
        return root;
    }

    private LinearLayout pageRoot() {
        LinearLayout root = column();
        root.setPadding(24, 20, 24, 24);
        return root;
    }

    private void setPage(LinearLayout root) {
        ScrollView scroll = new ScrollView(this);
        scroll.setFillViewport(true);
        scroll.setBackgroundColor(NAVY);
        scroll.addView(root, new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        setContentView(scroll);
        content = root;
    }

    private void addLogo(LinearLayout root, int height) {
        ImageView logo = new ImageView(this);
        logo.setImageResource(R.drawable.facilitus_wordmark);
        logo.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        root.addView(logo, params(0, 0, 0, 8, height));
    }

    private void addTitle(LinearLayout root, String title) {
        TextView value = text(title, 27, WHITE);
        value.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        value.setGravity(Gravity.CENTER);
        root.addView(value, params(0, 8, 0, 8));
    }

    private void addParagraph(LinearLayout root, String value) {
        TextView paragraph = text(value, 15, MUTED);
        paragraph.setGravity(Gravity.CENTER);
        root.addView(paragraph, params(0, 0, 0, 16));
    }

    private void addLabel(LinearLayout root, String value) {
        TextView label = text(value, 12, GOLD);
        label.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        label.setGravity(Gravity.CENTER);
        root.addView(label, params(0, 0, 0, 7));
    }

    private LinearLayout card() {
        LinearLayout value = column();
        value.setPadding(20, 18, 20, 18);
        value.setBackgroundColor(PANEL);
        return value;
    }

    private LinearLayout column() {
        LinearLayout value = new LinearLayout(this);
        value.setOrientation(LinearLayout.VERTICAL);
        value.setGravity(Gravity.CENTER_HORIZONTAL);
        value.setBackgroundColor(NAVY);
        return value;
    }

    private TextView text(String value, int size, int color) {
        TextView view = new TextView(this);
        view.setText(value);
        view.setTextSize(size);
        view.setTextColor(color);
        return view;
    }

    private EditText input(String hint) {
        EditText input = new EditText(this);
        input.setHint(hint);
        input.setHintTextColor(MUTED);
        input.setTextColor(WHITE);
        input.setTextSize(16);
        input.setSingleLine(true);
        input.setPadding(16, 12, 16, 12);
        input.setBackgroundColor(PANEL);
        return input;
    }

    private Button button(String value, int color) {
        Button button = new Button(this);
        button.setText(value);
        button.setTextColor(NAVY);
        button.setTextSize(16);
        button.setAllCaps(false);
        button.setGravity(Gravity.CENTER);
        button.setBackgroundColor(color);
        return button;
    }

    private void copyIdentity() {
        ClipboardManager clipboard = (ClipboardManager) getSystemService(Context.CLIPBOARD_SERVICE);
        if (clipboard != null) {
            clipboard.setPrimaryClip(ClipData.newPlainText("Facilitus device identifier", identity.getPanelValue()));
            if (status != null) {
                status.setText("Identificador copiado. Cole-o no painel.");
                status.setTextColor(CYAN);
            }
            toast("Identificador copiado");
        }
    }

    private void toast(String value) {
        Toast.makeText(this, value, Toast.LENGTH_SHORT).show();
    }

    private LinearLayout.LayoutParams params(int left, int top, int right, int bottom) {
        return params(left, top, right, bottom, ViewGroup.LayoutParams.WRAP_CONTENT);
    }

    private LinearLayout.LayoutParams params(int left, int top, int right, int bottom, int height) {
        LinearLayout.LayoutParams value = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, height);
        value.setMargins(left, top, right, bottom);
        return value;
    }
}
