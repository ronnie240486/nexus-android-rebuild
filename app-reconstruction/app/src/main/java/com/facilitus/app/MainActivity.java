package com.facilitus.app;

import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.graphics.Color;
import android.graphics.Typeface;
import android.os.Bundle;
import android.view.Gravity;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

/** Facilitus front door for the untouched original NEXUS runtime. */
public final class MainActivity extends Activity {
    private static final String ORIGINAL_PACKAGE = "cn.dolit.nexus";
    private static final int NAVY = Color.rgb(5, 8, 43);
    private static final int PANEL = Color.rgb(13, 19, 62);
    private static final int CYAN = Color.rgb(18, 217, 228);
    private static final int GOLD = Color.rgb(242, 182, 61);
    private static final int WHITE = Color.rgb(245, 248, 255);
    private static final int MUTED = Color.rgb(190, 202, 228);

    private DeviceIdentity.Snapshot identity;
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
        root.setPadding(48, 28, 48, 28);

        ImageView logo = new ImageView(this);
        logo.setImageResource(R.drawable.facilitus_wordmark);
        logo.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        root.addView(logo, params(0, 0, 0, 10, 170));

        TextView title = text("Bem-vindo ao Facilitus", 28, WHITE);
        title.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        title.setGravity(Gravity.CENTER);
        root.addView(title, params(0, 14, 0, 8));

        TextView intro = text(
                "Este é o acesso do seu aparelho. Copie o identificador para o painel e abra o aplicativo original.",
                16, MUTED);
        intro.setGravity(Gravity.CENTER);
        root.addView(intro, params(0, 0, 0, 18));

        LinearLayout card = column();
        card.setPadding(22, 18, 22, 18);
        card.setBackgroundColor(PANEL);

        TextView label = text("IDENTIFICADOR DO APARELHO", 12, GOLD);
        label.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        label.setGravity(Gravity.CENTER);
        card.addView(label, params(0, 0, 0, 8));

        TextView value = text(identity.getDisplayValue(), 24, CYAN);
        value.setTypeface(Typeface.MONOSPACE, Typeface.BOLD);
        value.setGravity(Gravity.CENTER);
        value.setTextIsSelectable(true);
        card.addView(value, params(0, 0, 0, 6));

        TextView source = text(identity.getSource(), 13, MUTED);
        source.setGravity(Gravity.CENTER);
        card.addView(source, params(0, 0, 0, 12));

        Button copy = button("Copiar identificador", CYAN);
        copy.setOnClickListener(view -> copyIdentity());
        card.addView(copy, params(0, 0, 0, 0));
        root.addView(card, params(0, 0, 0, 16));

        status = text("Instale o NEXUS original no aparelho e depois toque em abrir.", 14, MUTED);
        status.setGravity(Gravity.CENTER);
        root.addView(status, params(0, 0, 0, 14));

        Button openOriginal = button("Abrir aplicativo original", WHITE);
        openOriginal.setOnClickListener(view -> openOriginal());
        root.addView(openOriginal, params(0, 0, 0, 10));

        Button refresh = button("Atualizar identificador", GOLD);
        refresh.setOnClickListener(view -> {
            identity = DeviceIdentity.read(this);
            status.setText("Identificador atualizado: " + identity.getDisplayValue());
            status.setTextColor(CYAN);
        });
        root.addView(refresh, params(0, 0, 0, 0));

        setContentView(scroll(root));
    }

    private void copyIdentity() {
        ClipboardManager clipboard = (ClipboardManager) getSystemService(Context.CLIPBOARD_SERVICE);
        if (clipboard != null) {
            clipboard.setPrimaryClip(ClipData.newPlainText(
                    "Facilitus device identifier", identity.getPanelValue()));
            status.setText("Identificador copiado. Cole-o no painel.");
            status.setTextColor(CYAN);
        }
    }

    private void openOriginal() {
        PackageManager packageManager = getPackageManager();
        Intent launch = packageManager.getLaunchIntentForPackage(ORIGINAL_PACKAGE);
        if (launch == null) {
            launch = new Intent(Intent.ACTION_MAIN);
            launch.setPackage(ORIGINAL_PACKAGE);
            launch.addCategory(Intent.CATEGORY_LAUNCHER);
        }
        if (launch.resolveActivity(packageManager) == null) {
            status.setText("NEXUS original não instalado. Instale o APK original primeiro.");
            status.setTextColor(Color.rgb(255, 150, 150));
            return;
        }
        launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        try {
            startActivity(launch);
        } catch (Exception error) {
            Toast.makeText(this, "Não foi possível abrir o aplicativo original.", Toast.LENGTH_LONG).show();
            status.setText(error.getClass().getSimpleName() + ": " + String.valueOf(error.getMessage()));
            status.setTextColor(Color.rgb(255, 150, 150));
        }
    }

    private LinearLayout column() {
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setGravity(Gravity.CENTER_HORIZONTAL);
        root.setBackgroundColor(NAVY);
        return root;
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

    private TextView text(String value, int size, int color) {
        TextView view = new TextView(this);
        view.setText(value);
        view.setTextSize(size);
        view.setTextColor(color);
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
        return params(left, top, right, bottom, ViewGroup.LayoutParams.WRAP_CONTENT);
    }

    private LinearLayout.LayoutParams params(int left, int top, int right, int bottom, int height) {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, height);
        params.setMargins(left, top, right, bottom);
        return params;
    }
}
