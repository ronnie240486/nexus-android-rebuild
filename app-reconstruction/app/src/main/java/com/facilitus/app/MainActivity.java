package com.facilitus.app;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.Typeface;
import android.os.Bundle;
import android.text.InputType;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import com.facilitus.security.ActivationGate;
import com.facilitus.security.MacActivationValidator;

/**
 * Minimal installable Facilitus shell.
 *
 * <p>This first APK keeps activation local so it can be installed and
 * demonstrated without a backend. The production build must replace the
 * local decision with the authorized /activation/validate response and enforce
 * server-side MAC uniqueness.</p>
 */
public final class MainActivity extends Activity {
    private static final String PREFS = "facilitus_activation";
    private static final String MAC_KEY = "authorized_mac";
    private static final int NAVY = Color.rgb(5, 8, 43);
    private static final int CYAN = Color.rgb(18, 217, 228);
    private static final int GOLD = Color.rgb(242, 182, 61);
    private static final int WHITE = Color.rgb(245, 248, 255);

    private SharedPreferences preferences;
    private TextView status;
    private EditText macInput;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getWindow().setStatusBarColor(NAVY);
        getWindow().setNavigationBarColor(NAVY);
        preferences = getSharedPreferences(PREFS, Context.MODE_PRIVATE);

        String storedMac = preferences.getString(MAC_KEY, "");
        if (MacActivationValidator.hasValidFormat(storedMac)) {
            showHome(storedMac);
        } else {
            showActivation();
        }
    }

    private void showActivation() {
        LinearLayout root = createRoot();
        addWordmark(root, 190);

        TextView title = text("Ative o Facilitus", 26, WHITE);
        title.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        title.setGravity(Gravity.CENTER);
        root.addView(title, matchWrap(0, 20, 0, 8));

        TextView explanation = text(
                "Digite o MAC exclusivo de 12 dígitos atribuído ao seu usuário para continuar.",
                16,
                Color.rgb(190, 202, 228));
        explanation.setGravity(Gravity.CENTER);
        root.addView(explanation, matchWrap(0, 0, 0, 20));

        macInput = new EditText(this);
        macInput.setSingleLine(true);
        macInput.setInputType(InputType.TYPE_CLASS_NUMBER);
        macInput.setHint("000000000000");
        macInput.setTextColor(WHITE);
        macInput.setHintTextColor(Color.rgb(110, 128, 168));
        macInput.setTextSize(22);
        macInput.setGravity(Gravity.CENTER);
        macInput.setPadding(18, 14, 18, 14);
        root.addView(macInput, matchWrap(0, 0, 0, 14));

        Button activate = button("Ativar acesso", CYAN);
        activate.setOnClickListener(v -> activateLocalMac());
        root.addView(activate, matchWrap(0, 0, 0, 10));

        status = text("", 14, Color.rgb(255, 190, 190));
        status.setGravity(Gravity.CENTER);
        root.addView(status, matchWrap(0, 0, 0, 0));

        TextView note = text("Primeira build: validação local de demonstração. A unicidade definitiva será validada pelo backend.", 12, Color.rgb(125, 143, 180));
        note.setGravity(Gravity.CENTER);
        root.addView(note, matchWrap(0, 32, 0, 0));
        setContentView(wrap(root));
    }

    private void activateLocalMac() {
        String mac = MacActivationValidator.normalize(macInput == null ? "" : macInput.getText().toString());
        if (!MacActivationValidator.hasValidFormat(mac)) {
            status.setText("Informe exatamente 12 dígitos numéricos.");
            return;
        }

        ActivationGate.Decision decision = ActivationGate.Decision.fromBackend(
                ActivationGate.Status.ACTIVE, mac);
        if (!decision.canOpenHome(mac)) {
            status.setText("Não foi possível validar este MAC.");
            return;
        }

        preferences.edit().putString(MAC_KEY, mac).apply();
        showHome(mac);
    }

    private void showHome(String mac) {
        LinearLayout root = createRoot();
        addWordmark(root, 220);

        TextView title = text("Bem-vindo ao Facilitus", 26, WHITE);
        title.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        title.setGravity(Gravity.CENTER);
        root.addView(title, matchWrap(0, 24, 0, 10));

        TextView access = text("Acesso liberado", 18, GOLD);
        access.setGravity(Gravity.CENTER);
        root.addView(access, matchWrap(0, 0, 0, 8));

        TextView identifier = text("MAC autorizado: " + MacActivationValidator.maskForLog(mac), 15, Color.rgb(190, 202, 228));
        identifier.setGravity(Gravity.CENTER);
        root.addView(identifier, matchWrap(0, 0, 0, 28));

        TextView message = text("A base do aplicativo está pronta para receber catálogo, canais e player após a conexão com o backend autorizado.", 16, Color.rgb(190, 202, 228));
        message.setGravity(Gravity.CENTER);
        root.addView(message, matchWrap(0, 0, 0, 24));

        Button change = button("Trocar MAC", GOLD);
        change.setOnClickListener(v -> {
            preferences.edit().remove(MAC_KEY).apply();
            showActivation();
        });
        root.addView(change, matchWrap(0, 0, 0, 0));
        setContentView(wrap(root));
    }

    private LinearLayout createRoot() {
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setGravity(Gravity.CENTER_HORIZONTAL);
        root.setPadding(48, 36, 48, 36);
        root.setBackgroundColor(NAVY);
        return root;
    }

    private ScrollView wrap(LinearLayout content) {
        ScrollView scroll = new ScrollView(this);
        scroll.setFillViewport(true);
        scroll.setBackgroundColor(NAVY);
        scroll.addView(content, new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        return scroll;
    }

    private void addWordmark(LinearLayout root, int heightDp) {
        ImageView logo = new ImageView(this);
        logo.setImageResource(R.drawable.facilitus_wordmark);
        logo.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        root.addView(logo, matchWrap(0, 0, 0, 12, heightDp));
    }

    private TextView text(String value, int size, int color) {
        TextView view = new TextView(this);
        view.setText(value);
        view.setTextSize(size);
        view.setTextColor(color);
        return view;
    }

    private Button button(String label, int color) {
        Button button = new Button(this);
        button.setText(label);
        button.setTextColor(NAVY);
        button.setTextSize(16);
        button.setAllCaps(false);
        button.setBackgroundColor(color);
        return button;
    }

    private LinearLayout.LayoutParams matchWrap(int left, int top, int right, int bottom) {
        return new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT) {{
            setMargins(left, top, right, bottom);
        }};
    }

    private LinearLayout.LayoutParams matchWrap(int left, int top, int right, int bottom, int height) {
        LinearLayout.LayoutParams params = matchWrap(left, top, right, bottom);
        params.height = height;
        return params;
    }
}
