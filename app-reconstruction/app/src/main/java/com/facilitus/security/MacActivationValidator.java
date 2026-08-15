package com.facilitus.security;

import java.util.Locale;
import java.util.Objects;
import java.util.regex.Pattern;

/**
 * Validates the user activation identifier used by Facilitus.
 *
 * <p>This is intentionally a format validator only. Uniqueness, ownership,
 * revocation, expiry and device binding must be checked by the authorized
 * backend.</p>
 */
public final class MacActivationValidator {
    public static final int REQUIRED_DIGITS = 12;
    private static final Pattern MAC_PATTERN = Pattern.compile("[0-9]{12}");
    private static final String ALL_ZERO = "000000000000";

    private MacActivationValidator() {
        // Utility class.
    }

    /** Returns the trimmed value, or an empty string for null. */
    public static String normalize(String value) {
        return value == null ? "" : value.trim();
    }

    /** Returns true only for exactly twelve decimal digits and a non-zero value. */
    public static boolean hasValidFormat(String value) {
        String normalized = normalize(value);
        return MAC_PATTERN.matcher(normalized).matches() && !ALL_ZERO.equals(normalized);
    }

    /** Returns a masked value suitable for logs and diagnostics. */
    public static String maskForLog(String value) {
        String normalized = normalize(value);
        if (normalized.length() != REQUIRED_DIGITS) {
            return "••••";
        }
        return normalized.substring(0, 4) + "••••" + normalized.substring(8);
    }

    /** Constant-time-ish equality for two normalized activation identifiers. */
    public static boolean same(String left, String right) {
        String a = normalize(left);
        String b = normalize(right);
        if (a.length() != b.length()) {
            return false;
        }
        int difference = 0;
        for (int i = 0; i < a.length(); i++) {
            difference |= a.charAt(i) ^ b.charAt(i);
        }
        return difference == 0;
    }
}
