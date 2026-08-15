package com.facilitus.app;

import android.content.Context;
import android.content.SharedPreferences;
import android.provider.Settings;

import java.net.NetworkInterface;
import java.security.MessageDigest;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

/** Provides a stable panel identifier without depending on the legacy shell. */
public final class DeviceIdentity {
    private static final String PREFS = "facilitus_device_identity";
    private static final String FALLBACK_KEY = "fallback_id";

    private DeviceIdentity() {
    }

    public static Snapshot read(Context context) {
        String mac = readHardwareMac();
        if (mac != null) {
            return new Snapshot(mac, mac, "MAC da interface de rede");
        }

        SharedPreferences preferences = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        String androidId = Settings.Secure.getString(
                context.getContentResolver(), Settings.Secure.ANDROID_ID);
        if (androidId == null || androidId.trim().isEmpty()) {
            androidId = preferences.getString(FALLBACK_KEY, "");
        }
        if (androidId == null || androidId.trim().isEmpty()) {
            androidId = UUID.randomUUID().toString();
            preferences.edit().putString(FALLBACK_KEY, androidId).apply();
        }

        String fallback = numericCode(androidId);
        return new Snapshot(fallback, fallback, "ID persistente do aparelho");
    }

    private static String readHardwareMac() {
        try {
            List<NetworkInterface> interfaces = Collections.list(
                    NetworkInterface.getNetworkInterfaces());
            String[] preferred = {"eth0", "wlan0", "en0", "lan0"};
            for (String name : preferred) {
                String value = hardwareMac(NetworkInterface.getByName(name));
                if (value != null) {
                    return value;
                }
            }
            for (NetworkInterface networkInterface : interfaces) {
                String value = hardwareMac(networkInterface);
                if (value != null) {
                    return value;
                }
            }
        } catch (Exception ignored) {
            // Fall back to the persistent device identifier.
        }
        return null;
    }

    private static String hardwareMac(NetworkInterface networkInterface) {
        try {
            if (networkInterface == null || networkInterface.isLoopback()
                    || networkInterface.isVirtual()) {
                return null;
            }
            byte[] address = networkInterface.getHardwareAddress();
            if (address == null || address.length != 6) {
                return null;
            }
            StringBuilder result = new StringBuilder(12);
            for (byte value : address) {
                result.append(String.format(Locale.US, "%02X", value & 0xFF));
            }
            String value = result.toString();
            return "000000000000".equals(value) ? null : value;
        } catch (Exception ignored) {
            return null;
        }
    }

    private static String formatMac(String value) {
        return value.substring(0, 2) + ":" + value.substring(2, 4) + ":"
                + value.substring(4, 6) + ":" + value.substring(6, 8) + ":"
                + value.substring(8, 10) + ":" + value.substring(10, 12);
    }

    private static String numericCode(String source) {
        try {
            byte[] digest = MessageDigest.getInstance("SHA-256")
                    .digest(source.getBytes("UTF-8"));
            StringBuilder digits = new StringBuilder(12);
            for (byte value : digest) {
                digits.append(Math.abs(value) % 10);
                if (digits.length() == 12) {
                    break;
                }
            }
            return digits.toString();
        } catch (Exception ignored) {
            String digits = source.replaceAll("[^0-9]", "");
            while (digits.length() < 12) {
                digits += "0";
            }
            return digits.substring(0, 12);
        }
    }

    public static final class Snapshot {
        private final String panelValue;
        private final String displayValue;
        private final String source;

        Snapshot(String panelValue, String displayValue, String source) {
            this.panelValue = panelValue;
            this.displayValue = displayValue;
            this.source = source;
        }

        public String getPanelValue() {
            return panelValue;
        }

        public String getDisplayValue() {
            return displayValue;
        }

        public String getSource() {
            return source;
        }
    }
}
