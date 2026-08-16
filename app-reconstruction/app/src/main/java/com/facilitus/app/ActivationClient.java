package com.facilitus.app;

import android.os.Handler;
import android.os.Looper;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URLEncoder;
import java.net.URL;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Calls the panel activation contract without embedding credentials in the APK. */
public final class ActivationClient {
    public interface Callback {
        void onResult(boolean active, String message);
    }

    private static final ExecutorService EXECUTOR = Executors.newSingleThreadExecutor();
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private ActivationClient() {
    }

    public static void validate(String apiBase, String deviceId, Callback callback) {
        final String base = apiBase == null ? "" : apiBase.trim();
        final String identifier = deviceId == null ? "" : deviceId.trim();
        EXECUTOR.execute(() -> {
            boolean active = false;
            String message;
            HttpURLConnection connection = null;
            try {
                if (base.isEmpty()) {
                    throw new IllegalArgumentException("Configure a API do Servidor antes de validar.");
                }
                if (!identifier.matches("\\d{12}")) {
                    throw new IllegalArgumentException("O identificador precisa ter 12 dígitos.");
                }
                String normalized = base.endsWith("/") ? base.substring(0, base.length() - 1) : base;
                String target = normalized + "/activation/validate?device_id="
                        + URLEncoder.encode(identifier, "UTF-8");
                connection = (HttpURLConnection) new URL(target).openConnection();
                connection.setRequestMethod("GET");
                connection.setConnectTimeout(10000);
                connection.setReadTimeout(15000);
                connection.setRequestProperty("Accept", "application/json");
                connection.setRequestProperty("User-Agent", "Facilitus/0.5.0");
                int code = connection.getResponseCode();
                StringBuilder body = new StringBuilder();
                try (BufferedReader reader = new BufferedReader(new InputStreamReader(
                        code >= 400 ? connection.getErrorStream() : connection.getInputStream(), "UTF-8"))) {
                    String line;
                    while ((line = reader.readLine()) != null) {
                        body.append(line);
                    }
                }
                String response = body.toString().toLowerCase(Locale.US);
                active = code >= 200 && code < 300
                        && (response.contains("\"active\":true")
                        || response.contains("\"authorized\":true")
                        || response.contains("\"status\":\"active\"")
                        || response.contains("\"status\": \"active\"")
                        || response.trim().equals("active"));
                message = active ? "Aparelho liberado pelo painel." : "Aparelho ainda não está liberado no painel.";
            } catch (Exception error) {
                message = error.getMessage() == null ? error.getClass().getSimpleName() : error.getMessage();
            } finally {
                if (connection != null) {
                    connection.disconnect();
                }
            }
            boolean finalActive = active;
            String finalMessage = message;
            MAIN.post(() -> callback.onResult(finalActive, finalMessage));
        });
    }
}
