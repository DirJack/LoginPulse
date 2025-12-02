
<h2 align="center"> Google Sign in to Discord </h2>

SYNOPSIS

Uses Powershell and HTML to create a fake google login page which catches login credentials and sends them to a webhook.

USAGE

1. Replace YOUR_WEBBHOOK_HERE with your webhook
2. Run script on target system.

## Inventur-Oberfläche

`inventory_app.py` ist eine kleine Tkinter-Oberfläche für eine lokale Bestandsaufnahme. Sie erlaubt das Anlegen von Artikeln mit Menge, Standort und Notizen. Die Liste kann als CSV exportiert werden.

### Ausführen

```bash
python inventory_app.py
```

### Als Windows-EXE erstellen

1. PyInstaller installieren: `pip install pyinstaller`
2. EXE bauen: `pyinstaller --onefile --noconsole inventory_app.py`
3. Die fertige Datei liegt danach im Unterordner `dist/`.
