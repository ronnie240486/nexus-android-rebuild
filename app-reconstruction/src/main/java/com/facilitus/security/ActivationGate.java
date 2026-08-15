package com.facilitus.security;

import java.util.Objects;

/** Controls access to the protected Facilitus home screen. */
public final class ActivationGate {
    public enum Status {
        ACTIVE,
        INVALID_FORMAT,
        NOT_FOUND,
        INACTIVE,
        EXPIRED,
        ALREADY_BOUND,
        DEVICE_MISMATCH,
        NETWORK_ERROR
    }

    public static final class Decision {
        private final Status status;
        private final String authorizedMac;

        private Decision(Status status, String authorizedMac) {
            this.status = Objects.requireNonNull(status, "status");
            this.authorizedMac = MacActivationValidator.normalize(authorizedMac);
        }

        public static Decision fromBackend(Status status, String authorizedMac) {
            return new Decision(status, authorizedMac);
        }

        public Status status() {
            return status;
        }

        public String authorizedMac() {
            return authorizedMac;
        }

        public boolean canOpenHome(String submittedMac) {
            return status == Status.ACTIVE
                    && MacActivationValidator.hasValidFormat(submittedMac)
                    && MacActivationValidator.same(authorizedMac, submittedMac);
        }

        public String maskedMacForLog() {
            return MacActivationValidator.maskForLog(authorizedMac);
        }
    }

    private ActivationGate() {
        // Utility class.
    }
}
