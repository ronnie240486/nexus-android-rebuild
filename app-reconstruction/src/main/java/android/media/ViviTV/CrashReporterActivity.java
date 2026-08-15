package android.media.ViviTV;

import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.Typeface;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.Gravity;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

/** Shows the last startup exception instead of allowing a silent close. */
public final class CrashReporterActivity extends Activity {
    public static final String EXTRA_REPORT = "facilitus_report";
    private static final String PREFS = "facilitus_crash_report";
    private static final String REPORT_KEY = "last_crash";
    private static final int NAVY = Color.rgb(5, 8, 43);
    private static final int WHITE = Color.rgb(245, 248, 255);
    private static final int CYAN = Color.rgb(18, 217, 228);
    private static final int MUTED = Color.rgb(190, 202, 228);

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        getWindow().setStatusBarColor(NAVY);
        getWindow().setNavigationBarColor(NAVY);

        String report = getIntent().getStringExtra(EXTRA_REPORT);
        if (TextUtils.isEmpty(report)) {
            report = getSharedPreferences(PREFS, MODE_PRIVATE).getString(REPORT_KEY,
                    "Nenhum relatório de crash foi salvo.");
        }
        buildScreen(report);
    }

    private void buildScreen(String report) {
        LinearLayout content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setGravity(Gravity.CENTER_HORIZONTAL);
        content.setPadding(34, 28, 34, 28);
        content.setBackgroundColor(NAVY);

        TextView title = text("Diagnóstico do Facilitus", 25, WHITE);
        title.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        title.setGravity(Gravity.CENTER);
        content.addView(title, params(0, 0, 0, 10));

        TextView subtitle = text(
                "O aplicativo encontrou um erro ao iniciar. Copie este relatório e envie para a equipe.",
                16, MUTED);
        subtitle.setGravity(Gravity.CENTER);
        content.addView(subtitle, params(0, 0, 0, 16));

        TextView reportView = text(report, 13, Color.rgb(225, 232, 248));
        reportView.setTypeface(Typeface.MONOSPACE);
        reportView.setTextIsSelectable(true);
        reportView.setPadding(16, 16, 16, 16);
        content.addView(reportView, params(0, 0, 0, 14));

        Button copy = button("Copiar relatório", CYAN);
        copy.setOnClickListener(view -> copyReport(report));
        content.addView(copy, params(0, 0, 0, 10));

        Button retry = button("Tentar abrir novamente", WHITE);
        retry.setOnClickListener(view -> {
            Intent intent = new Intent(this, FacilitusGateActivity.class);
            startActivity(intent);
            finish();
        });
        content.addView(retry, params(0, 0, 0, 0));

        ScrollView scroll = new ScrollView(this);
        scroll.setFillViewport(true);
        scroll.setBackgroundColor(NAVY);
        scroll.addView(content, new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));
        setContentView(scroll);
    }

    private void copyReport(String report) {
        ClipboardManager clipboard = (ClipboardManager) getSystemService(Context.CLIPBOARD_SERVICE);
        if (clipboard != null) {
            clipboard.setPrimaryClip(ClipData.newPlainText("Facilitus crash report", report));
        }
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
}
