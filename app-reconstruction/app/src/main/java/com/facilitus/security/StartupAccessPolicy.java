package com.facilitus.security;

/** Resolves the first screen that the reconstructed Facilitus app may open. */
public final class StartupAccessPolicy {
    public enum Destination {
        ACTIVATION,
        HOME
    }

    private StartupAccessPolicy() {
        // Utility class.
    }

    public static Destination resolve(String submittedMac, ActivationGate.Decision decision) {
        if (decision == null || !decision.canOpenHome(submittedMac)) {
            return Destination.ACTIVATION;
        }
        return Destination.HOME;
    }
}
