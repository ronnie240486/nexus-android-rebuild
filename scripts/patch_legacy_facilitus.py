from pathlib import Path
import re
import sys

root = Path(sys.argv[1])
manifest_path = root / "AndroidManifest.xml"
manifest = manifest_path.read_text()

apktool_yml = root / "apktool.yml"
if apktool_yml.exists():
    metadata = apktool_yml.read_text()
    metadata = metadata.replace("versionCode: '212'", "versionCode: 212")
    metadata = metadata.replace("versionName: 0.2.12", "versionName: '0.2.12'")
    apktool_yml.write_text(metadata)

# Keep the original package for compatibility with the legacy shell and its
# persisted data. The visible product identity is changed to Facilitus below.
manifest = manifest.replace('android:icon="@mipmap/ic_launcher_warez"', 'android:icon="@mipmap/facilitus_launcher"')
manifest = manifest.replace('android:banner="@mipmap/ic_lau_nexus_banner"', 'android:banner="@drawable/facilitus_wordmark"')

crash_activity = '''<activity android:exported="false" android:name="android.media.ViviTV.CrashReporterActivity" android:screenOrientation="landscape"/>\n        '''
application_marker = '    <application '
application_start = manifest.index(application_marker)
application_open_end = manifest.index('>', application_start) + 1
manifest = manifest[:application_open_end] + '\n        ' + crash_activity + manifest[application_open_end:]

prelauncher_index = manifest.index('android.media.ViviTV.Pre_launcher')
start = manifest.rfind('<activity ', 0, prelauncher_index)
end = manifest.index('</activity>', prelauncher_index) + len('</activity>')
legacy_block = manifest[start:end]
legacy_block = legacy_block.replace(
    '<action android:name="android.intent.action.MAIN"/>',
    ''
)
legacy_block = legacy_block.replace(
    '<category android:name="android.intent.category.LAUNCHER"/>',
    ''
)
legacy_block = legacy_block.replace(
    '<category android:name="android.intent.category.LEANBACK_LAUNCHER"/>',
    ''
)
legacy_block = re.sub(r'\\s*<intent-filter>\\s*</intent-filter>', '', legacy_block)

gate_block = '''<activity android:exported="true" android:label="@string/app_name" android:name="android.media.ViviTV.FacilitusGateActivity" android:screenOrientation="landscape">
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LEANBACK_LAUNCHER"/>
            </intent-filter>
        </activity>
        '''
manifest = manifest[:start] + gate_block + legacy_block + manifest[end:]
manifest_path.write_text(manifest)

application_smali = root / "smali/s/h/e/l/l/S.smali"
if application_smali.exists():
    application_text = application_smali.read_text()
    method_header = '.method public onCreate()V\n    .locals 5\n'
    install_call = method_header + '\n    invoke-static {p0}, Landroid/media/ViviTV/CrashHandler;->install(Landroid/app/Application;)V\n'
    if method_header in application_text and 'CrashHandler;->install' not in application_text:
        application_text = application_text.replace(method_header, install_call, 1)
        application_smali.write_text(application_text)

for path in (root / "res").glob("values*/strings.xml"):
    text = path.read_text(errors="replace")
    text = re.sub(r'(<string\s+name="app_name">).*?(</string>)', r'\1Facilitus\2', text)
    path.write_text(text)

print("patched_manifest_and_app_name")
