
# Rasa Server (español)
## Instalación
```bash
pip install rasa
rasa train
```

## Ejecutar servidor con CORS para Web
```bash
rasa run --enable-api --cors "*"
```

El endpoint REST quedará en:
```
http://localhost:5005/webhooks/rest/webhook
```

Asegúrate de iniciar Flutter web con:
```
flutter run -d chrome --web-renderer html --dart-define=RASA_URL=http://localhost:5005
```
o reemplazar por la IP/DOMINIO donde corre Rasa.
