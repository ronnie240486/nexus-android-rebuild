package android.media.ViviTV;

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

import java.net.NetworkInterface;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

/**
 * Facilitus entry screen for the legacy NEXUS application.
 *
 * <p>The MAC shown here is supplied by the device network interface. It is
 * intentionally not randomly generated and it is not replaced by Android ID.
 * The operator copies it into the panel, associates the user's list, then
 * continues into the original application modules.</p>
 */
public final class FacilitusGateActivity extends Activity {
    private static final int NAVY = Color.rgb(5, 8, 43);
    private static final int CYAN = Color.rgb(18, 217, 228);
    private static final int GOLD = Color.rgb(242, 182, 61);
    private static final int WHITE = Color.rgb(245, 248, 255);
    private static final int MUTED = Color.rgb(190, 202, 228);

    private TextView macValue;
    private TextView status;
    private Button copyButton;
    private Button continueButton;

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        getWindow().setStatusBarColor(NAVY);
        getWindow().setNavigationBarColor(NAVY);
        buildScreen();
        refreshMac();
    }

    private void buildScreen() {
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setGravity(Gravity.CENTER_HORIZONTAL);
        root.setPadding(64, 38, 64, 38);
        root.setBackgroundColor(NAVY);

        int logoId = getResources().getIdentifier(
                "facilitus_wordmark", "drawable", getPackageName());
        if (logoId != 0) {
            ImageView logo = new ImageView(this);
            logo.setImageResource(logoId);
            logo.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
            root.addView(logo, params(0, 0, 0, 14, 210));
        }

        TextView welcome = text("Bem-vindo ao Facilitus", 28, WHITE);
        welcome.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        welcome.setGravity(Gravity.CENTER);
        root.addView(welcome, params(0, 12, 0, 8));

        TextView instruction = text(
                "Este aparelho fornece o MAC abaixo. Copie o código e cole no painel para vincular a lista deste usuário.",
                16, MUTED);
        instruction.setGravity(Gravity.CENTER);
        root.addView(instruction, params(0, 0, 0, 18));

        macValue = text("Lendo MAC do aparelho...", 24, CYAN);
        macValue.setTypeface(Typeface.MONOSPACE, Typeface.BOLD);
        macValue.setGravity(Gravity.CENTER);
        root.addView(macValue, params(0, 0, 0, 12));

        copyButton = button("Copiar MAC para o painel", CYAN);
        copyButton.setOnClickListener(view -> copyMac());
        root.addView(copyButton, params(0, 0, 0, 10));

        Button reloadButton = button("Atualizar MAC", GOLD);
        reloadButton.setOnClickListener(view -> refreshMac());
        root.addView(reloadButton, params(0, 0, 0, 10));

        continueButton = button("Continuar para o aplicativo", WHITE);
        continueButton.setOnClickListener(view -> launchLegacyApp());
        root.addView(continueButton, params(0, 0, 0, 12));

        status = text("", 14, MUTED);
        status.setGravity(Gravity.CENTER);
        root.addView(status, params(0, 0, 0, 0));

        ScrollView scroll = new ScrollView(this);
        scroll.setFillViewport(true);
        scroll.setBackgroundColor(NAVY);
        scroll.addView(root, new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));
        setContentView(scroll);
    }

    private void refreshMac() {
        String mac = readDeviceMac();
        boolean available = mac != null && mac.length() == 12;
        if (available) {
            macValue.setText(formatMac(mac));
            status.setText("MAC fornecido pelo aparelho. Cadastre-o no painel.");
            status.setTextColor(MUTED);
        } else {
            macValue.setText("MAC indisponível");
            status.setText("Não foi possível ler o MAC físico. Verifique a rede e toque em Atualizar MAC.");
            status.setTextColor(Color.rgb(255, 190, 190));
        }
        copyButton.setEnabled(available);
        continueButton.setEnabled(available);
    }

    private void copyMac() {
        String mac = readDeviceMac();
        if (mac == null || mac.length() != 12) {
            status.setText("MAC indisponível neste aparelho.");
            return;
        }
        ClipboardManager clipboard = (ClipboardManager) getSystemService(Context.CLIPBOARD_SERVICE);
        if (clipboard != null) {
            clipboard.setPrimaryClip(ClipData.newPlainText("Facilitus MAC", mac));
            status.setText("MAC copiado. Cole-o no painel e vincule a lista.");
            status.setTextColor(CYAN);
        }
    }

    private void launchLegacyApp() {
        Intent intent = new Intent();
        intent.setClassName(getPackageName(), "android.media.ViviTV.Pre_launcher");
        startActivity(intent);
        finish();
    }

    private String readDeviceMac() {
        try {
            List<NetworkInterface> interfaces = Collections.list(
                    NetworkInterface.getNetworkInterfaces());
            String[] preferred = {"eth0", "wlan0", "en0", "lan0"};
            for (String name : preferred) {
                NetworkInterface candidate = NetworkInterface.getByName(name);
                String mac = formatHardwareAddress(candidate);
                if (mac != null) {
                    return mac;
                }
            }
            for (NetworkInterface networkInterface : interfaces) {
                String mac = formatHardwareAddress(networkInterface);
                if (mac != null) {
                    return mac;
                }
            }
        } catch (Exception ignored) {
            // The UI reports that the device MAC is unavailable.
        }
        return null;
    }

    private String formatHardwareAddress(NetworkInterface networkInterface) {
        try {
            if (networkInterface == null || networkInterface.isLoopback()
                    || networkInterface.isVirtual()) {
                return null;
            }
            byte[] address = networkInterface.getHardwareAddress();
            if (address == null || address.length != 6) {
                return null;
            }
            StringBuilder builder = new StringBuilder(12);
            for (byte value : address) {
                builder.append(String.format(Locale.US, "%02X", value & 0xFF));
            }
            String result = builder.toString();
            return "000000000000".equals(result) ? null : result;
        } catch (Exception ignored) {
            return null;
        }
    }

    private String formatMac(String raw) {
        if (raw.length() != 12) {
            return raw;
        }
        return raw.substring(0, 2) + ":" + raw.substring(2, 4) + ":"
                + raw.substring(4, 6) + ":" + raw.substring(6, 8) + ":"
                + raw.substring(8, 10) + ":" + raw.substring(10, 12);
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

    private LinearLayout.LayoutParams params(int left, int top, int right, int bottom, int height) {
        LinearLayout.LayoutParams params = params(left, top, right, bottom);
        params.height = height;
        return params;
    }
}
