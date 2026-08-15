from pathlib import Path
import re
import sys

path = Path(sys.argv[1])
text = path.read_text()
routes = set(re.findall(r'addMenuButton\(grid,\s*"[^"]+",\s*"([^"]+)"\)', text))
cases = set(re.findall(r'case\s+"([^"]+)"\s*:\s*(show\w+)\(\)', text))
methods = set(re.findall(r'private void (show\w+)\(', text))
missing_cases = sorted(routes - {route for route, _ in cases})
missing_methods = sorted(method for _, method in cases if method not in methods)
checks = {
    "welcome": "showWelcome" in text,
    "activation": "Já cadastrei no painel" in text,
    "device_identifier": "getDisplayValue" in text and "copyIdentity" in text,
    "home": "showHome" in text,
    "gold_settings": "Configurações" in text and "GOLD" in text,
    "private_list_label": "Lista privada" in text,
}
print(f"routes={len(routes)}")
print(f"cases={len(cases)}")
print(f"methods={len(methods)}")
print(f"missing_cases={missing_cases}")
print(f"missing_methods={missing_methods}")
for key, value in checks.items():
    print(f"{key}={value}")
if missing_cases or missing_methods or not all(checks.values()):
    raise SystemExit(1)
