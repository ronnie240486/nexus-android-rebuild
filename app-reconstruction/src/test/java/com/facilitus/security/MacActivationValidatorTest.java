package com.facilitus.security;

public final class MacActivationValidatorTest {
    public static void main(String[] args) {
        assertTrue(MacActivationValidator.hasValidFormat("123456789012"));
        assertTrue(MacActivationValidator.hasValidFormat(" 123456789012 "));
        assertFalse(MacActivationValidator.hasValidFormat("12345678901"));
        assertFalse(MacActivationValidator.hasValidFormat("1234567890123"));
        assertFalse(MacActivationValidator.hasValidFormat("1234ABCD9012"));
        assertFalse(MacActivationValidator.hasValidFormat("000000000000"));
        assertEquals("1234••••9012", MacActivationValidator.maskForLog("123456789012"));

        ActivationGate.Decision active = ActivationGate.Decision.fromBackend(
                ActivationGate.Status.ACTIVE, "123456789012");
        assertTrue(active.canOpenHome("123456789012"));
        assertFalse(active.canOpenHome("123456789013"));
        assertFalse(active.canOpenHome("12345678901"));

        ActivationGate.Decision revoked = ActivationGate.Decision.fromBackend(
                ActivationGate.Status.INACTIVE, "123456789012");
        assertFalse(revoked.canOpenHome("123456789012"));
        assertEquals(StartupAccessPolicy.Destination.HOME,
                StartupAccessPolicy.resolve("123456789012", active));
        assertEquals(StartupAccessPolicy.Destination.ACTIVATION,
                StartupAccessPolicy.resolve("123456789012", revoked));
        assertEquals(StartupAccessPolicy.Destination.ACTIVATION,
                StartupAccessPolicy.resolve("123456789012", null));

        System.out.println("MacActivationValidatorTest: PASS");
    }

    private static void assertTrue(boolean condition) {
        if (!condition) {
            throw new AssertionError("expected true");
        }
    }

    private static void assertFalse(boolean condition) {
        if (condition) {
            throw new AssertionError("expected false");
        }
    }

    private static void assertEquals(String expected, String actual) {
        if (!expected.equals(actual)) {
            throw new AssertionError("expected " + expected + ", got " + actual);
        }
    }

    private static void assertEquals(Object expected, Object actual) {
        if (!expected.equals(actual)) {
            throw new AssertionError("expected " + expected + ", got " + actual);
        }
    }
}
