package com.facilitus.app;

import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.Typeface;
import android.os.Bundle;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

/** Stable, offline-first entry point for the clean Facilitus rebuild. */
public final class MainActivity extends Activity {
    private static final int NAVY = Color.rgb(5, 8, 43);
    private static final int PANEL = Color.rgb(13, 19, 62);
    private static final int CYAN = Color.rgb(18, 217, 228);
    private static final int GOLD = Color.rgb(242, 182, 61);
    private static final int WHITE = Color.rgb(245, 248, 255);
    private static final int MUTED = Color.rgb(190, 202, 228);

    private DeviceIdentity.Snapshot identity;
    private TextView identityValue;
    private TextView identitySource;
    private TextView status;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getWindow().setStatusBarColor(NAVY);
        getWindow().setNavigationBarColor(NAVY);
        identity = DeviceIdentity.read(this);
        showWelcome();
    }

    private void showWelcome() {
        LinearLayout root = column();
        root.setPadding(54, 32, 54, 32);

        ImageView logo = new ImageView(this);
        logo.setImageResource(R.drawable.facilitus_wordmark);
        logo.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        root.addView(logo, params(0, 0, 0, 10, 180));

        TextView welcome = title("Bem-vindo ao Facilitus", 28);
        root.addView(welcome, params(0, 14, 0, 8));

        TextView intro = centeredText(
                "Seu aplicativo de entretenimento está pronto. Primeiro copie o identificador deste aparelho para cadastrar o usuário no painel.",
                16, MUTED);
        root.addView(intro, params(0, 0, 0, 18));

        LinearLayout identityCard = card();
        TextView cardLabel = centeredText("IDENTIFICADOR PARA O PAINEL", 12, GOLD);
        cardLabel.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        identityCard.addView(cardLabel, params(0, 0, 0, 8));

        identityValue = centeredText(identity.getDisplayValue(), 25, CYAN);
        identityValue.setTypeface(Typeface.MONOSPACE, Typeface.BOLD);
        identityValue.setTextIsSelectable(true);
        identityCard.addView(identityValue, params(0, 0, 0, 6));

        identitySource = centeredText(identity.getSource(), 13, MUTED);
        identityCard.addView(identitySource, params(0, 0, 0, 12));

        Button copy = button("Copiar identificador", CYAN);
        copy.setOnClickListener(view -> copyIdentity());
        identityCard.addView(copy, params(0, 0, 0, 0));
        root.addView(identityCard, params(0, 0, 0, 14));

        status = centeredText(
                "Cole o identificador no painel, vincule a lista do usuário e depois continue.",
                14, MUTED);
        root.addView(status, params(0, 0, 0, 20));

        Button continueButton = button("Continuar", WHITE);
        continueButton.setOnClickListener(view -> showHome());
        root.addView(continueButton, params(0, 0, 0, 18));

        TextView note = centeredText(
                "A primeira build limpa funciona offline. Catálogo e reprodução serão conectados somente após o contrato do painel.",
                12, Color.rgb(125, 143, 180));
        root.addView(note, params(0, 0, 0, 0));

        setContentView(scroll(root));
    }

    private void showHome() {
        LinearLayout root = column();
        root.setPadding(44, 28, 44, 28);

        ImageView logo = new ImageView(this);
        logo.setImageResource(R.drawable.facilitus_wordmark);
        logo.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        root.addView(logo, params(0, 0, 0, 10, 120));

        TextView heading = title("Início", 25);
        root.addView(heading, params(0, 12, 0, 4));
        root.addView(centeredText("Escolha um módulo para continuar.", 15, MUTED),
                params(0, 0, 0, 18));

        LinearLayout grid = column();
        grid.addView(moduleButton("Filmes", "Catálogo de filmes", CYAN), params(0, 0, 0, 10));
        grid.addView(moduleButton("Séries", "Séries e temporadas", GOLD), params(0, 0, 0, 10));
        grid.addView(moduleButton("Canais ao vivo", "Canais e programação", WHITE), params(0, 0, 0, 10));
        grid.addView(moduleButton("Minhas listas", "Listas privadas do usuário", CYAN), params(0, 0, 0, 10));
        grid.addView(moduleButton("Configurações", "DNS, aparência e conta", GOLD), params(0, 0, 0, 16));
        root.addView(grid, params(0, 0, 0, 0));

        Button back = button("Voltar para o identificador", WHITE);
        back.setOnClickListener(view -> showWelcome());
        root.addView(back, params(0, 0, 0, 0));
        setContentView(scroll(root));
    }

    private Button moduleButton(String name, String description, int color) {
        Button button = button(name + "\n" + description, color);
        button.setGravity(Gravity.CENTER);
        button.setTextSize(16);
        button.setOnClickListener(view -> Toast.makeText(
                this, name + " será conectado ao painel na próxima etapa.", Toast.LENGTH_SHORT).show());
        return button;
    }

    private void copyIdentity() {
        ClipboardManager clipboard = (ClipboardManager) getSystemService(Context.CLIPBOARD_SERVICE);
        if (clipboard != null) {
            clipboard.setPrimaryClip(ClipData.newPlainText(
                    "Facilitus device identifier", identity.getPanelValue()));
            if (status != null) {
                status.setText("Identificador copiado. Cole-o no painel para vincular a lista.");
                status.setTextColor(CYAN);
            }
        }
    }

    private LinearLayout column() {
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setGravity(Gravity.CENTER_HORIZONTAL);
        root.setBackgroundColor(NAVY);
        return root;
    }

    private LinearLayout card() {
        LinearLayout card = column();
        card.setPadding(24, 20, 24, 20);
        card.setBackgroundColor(PANEL);
        return card;
    }

    private ScrollView scroll(LinearLayout content) {
        ScrollView scroll = new ScrollView(this);
        scroll.setFillViewport(true);
        scroll.setBackgroundColor(NAVY);
        scroll.addView(content, new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));
        return scroll;
    }

    private TextView title(String value, int size) {
        TextView view = centeredText(value, size, WHITE);
        view.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        return view;
    }

    private TextView centeredText(String value, int size, int color) {
        TextView view = new TextView(this);
        view.setText(value);
        view.setTextSize(size);
        view.setTextColor(color);
        view.setGravity(Gravity.CENTER);
        return view;
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

    private LinearLayout.LayoutParams params(int left, int top, int right, int bottom) {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        params.setMargins(left, top, right, bottom);
        return params;
    }

    private LinearLayout.LayoutParams params(int left, int top, int right, int bottom, int height) {
        LinearLayout.LayoutParams params = params(left, top, right, bottom);
        params.height = height;
        return params;
    }
}
