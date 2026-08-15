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

manifest = manifest.replace('package="cn.dolit.nexus"', 'package="com.facilitus.app"')
manifest = manifest.replace('android:icon="@mipmap/ic_launcher_warez"', 'android:icon="@mipmap/facilitus_launcher"')
manifest = manifest.replace('android:banner="@mipmap/ic_lau_nexus_banner"', 'android:banner="@drawable/facilitus_wordmark"')

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

for path in (root / "res").glob("values*/strings.xml"):
    text = path.read_text(errors="replace")
    text = re.sub(r'(<string\s+name="app_name">).*?(</string>)', r'\1Facilitus\2', text)
    path.write_text(text)

print("patched_manifest_and_app_name")
