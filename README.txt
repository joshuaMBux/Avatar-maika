
# Flutter Web - Avatar IA Anime (voz latina)
## Requisitos
- Flutter 3.22+
- Navegador con permisos de micrófono (HTTPS recomendado para STT en producción).

## Ejecutar en modo web (desarrollo)
1. Inicia el servidor Rasa (ver carpeta `../rasa_server`).
2. Desde esta carpeta:
   ```bash
   flutter run -d chrome --web-renderer html --dart-define=RASA_URL=http://localhost:5005
   ```
   - Si Rasa está en otra máquina/IP, cambia `RASA_URL` por su URL pública.
   - Asegúrate de habilitar CORS en Rasa (`--cors "*"`).

## Producción (build web)
```bash
flutter build web --web-renderer html --dart-define=RASA_URL=https://TU_DOMINIO_O_IP:5005
```
Sirve `build/web` detrás de HTTPS (recomendado).

## Notas sobre TTS/STT en Web
- `flutter_tts` usa la API Web Speech (speechSynthesis). Algunas voces dependen del navegador/SO.
- `speech_to_text` usa Web Speech (SpeechRecognition). Requiere HTTPS o `localhost` y permiso de micrófono.
