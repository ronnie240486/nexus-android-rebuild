package android.media.ViviTV;

import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.os.Build;

import java.io.PrintWriter;
import java.io.StringWriter;

/** Installs a visible crash reporter for the diagnostic build. */
public final class CrashHandler {
    private static final String PREFS = "facilitus_crash_report";
    private static final String REPORT_KEY = "last_crash";
    private static boolean installed;

    private CrashHandler() {
    }

    public static synchronized void install(Application application) {
        if (installed) {
            return;
        }
        installed = true;
        final Thread.UncaughtExceptionHandler previous = Thread.getDefaultUncaughtExceptionHandler();
        Thread.setDefaultUncaughtExceptionHandler(
                new ReportingHandler(application.getApplicationContext(), previous));
    }

    private static final class ReportingHandler implements Thread.UncaughtExceptionHandler {
        private final Context context;
        private final Thread.UncaughtExceptionHandler previous;

        ReportingHandler(Context context, Thread.UncaughtExceptionHandler previous) {
            this.context = context;
            this.previous = previous;
        }

        @Override
        public void uncaughtException(Thread thread, Throwable throwable) {
            String report = formatReport(thread, throwable);
            try {
                context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                        .edit()
                        .putString(REPORT_KEY, report)
                        .commit();

                Intent intent = new Intent(context, CrashReporterActivity.class);
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK
                        | Intent.FLAG_ACTIVITY_CLEAR_TOP
                        | Intent.FLAG_ACTIVITY_SINGLE_TOP);
                intent.putExtra(CrashReporterActivity.EXTRA_REPORT, report);
                context.startActivity(intent);

                // Keep the process alive long enough for the user to read and copy
                // the report. The previous handler is intentionally not called.
                return;
            } catch (Throwable reporterFailure) {
                String fallback = report + "\n\nREPORTER_FAILURE:\n"
                        + stackTrace(reporterFailure);
                try {
                    context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                            .edit().putString(REPORT_KEY, fallback).commit();
                } catch (Throwable ignored) {
                    // Last resort: let Android's own handler deal with it.
                }
                if (previous != null) {
                    previous.uncaughtException(thread, throwable);
                }
            }
        }

        private String formatReport(Thread thread, Throwable throwable) {
            StringBuilder report = new StringBuilder();
            report.append("FACILITUS CRASH REPORT\n");
            report.append("package=").append(context.getPackageName()).append('\n');
            report.append("android=").append(Build.VERSION.RELEASE)
                    .append(" (API ").append(Build.VERSION.SDK_INT).append(")\n");
            report.append("model=").append(Build.MANUFACTURER).append(' ')
                    .append(Build.MODEL).append('\n');
            report.append("thread=").append(thread == null ? "unknown" : thread.getName()).append('\n');
            report.append("\nEXCEPTION:\n").append(stackTrace(throwable));
            return report.toString();
        }

        private String stackTrace(Throwable throwable) {
            StringWriter writer = new StringWriter();
            PrintWriter printer = new PrintWriter(writer);
            if (throwable == null) {
                printer.println("<null throwable>");
            } else {
                throwable.printStackTrace(printer);
            }
            printer.flush();
            return writer.toString();
        }
    }
}
