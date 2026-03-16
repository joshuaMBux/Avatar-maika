# 🤖 Avatar IA Anime - Maika

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-3.4.0+-02569B?style=for-the-badge&logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.4.0+-0175C2?style=for-the-badge&logo=dart)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

Una aplicación de asistente virtual con avatar anime interactivo, construido con Flutter e integrado con Rasa para conversaciones inteligentes.

</div>

---

## ✨ Características

- **👤 Avatar Animado**: Avatar anime dinámico que reacciona cuando habla
- **🎤 Voz**: Entrada de voz con Speech-to-Text (STT)
- **🔊 Audio**: Salida de voz con Text-to-Speech (TTS) en español latinoamericano
- **💬 Chat Inteligente**: Integrado con Rasa NLU para conversaciones naturales
- **🌐 Multiplataforma**: Funciona en Android, iOS, Windows, Linux y Web

---

## 📋 Requisitos Previos

- Flutter SDK 3.4.0+
- Dart SDK 3.4.0+
- Servidor Rasa corriendo en `http://localhost:5005`

---

## 🚀 Instalación

1. **Clonar el repositorio**
   ```bash
   git clone https://github.com/joshuaMBux/Avatar-maika.git
   cd Avatar-maika
   ```

2. **Instalar dependencias**
   ```bash
   flutter pub get
   ```

3. **Ejecutar la aplicación**
   ```bash
   flutter run
   ```

---

## ⚙️ Configuración

### Rasa Server

El proyecto se conecta a un servidor Rasa por defecto en `http://localhost:5005`. Para cambiar la URL:

```bash
flutter run --dart-define=RASA_URL=http://tu-servidor:5005
```

### Permisos Necesarios

- **Micrófono**: Para entrada de voz (STT)
- **Internet**: Para conectar con el servidor Rasa

---

## 🏗️ Estructura del Proyecto

```
lib/
├── main.dart                 # Punto de entrada de la app
├── screens/
│   └── chat_screen.dart      # Pantalla principal de chat
├── services/
│   ├── config.dart           # Configuración global
│   ├── rasa_service.dart     # Servicio de diálogo con Rasa
│   ├── stt_service.dart      # Speech-to-Text
│   └── tts_service.dart      # Text-to-Speech
└── widgets/
    └── avatar_widget.dart    # Widget del avatar animado
```

---

## 🎮 Uso

1. **Escribir mensaje**: Usa el campo de texto y presiona "Enviar" o Enter
2. **Usar voz**: Presiona el botón "🎤 Hablar" y habla en español
3. **El avatar reacciona**: Cambia entre estado idle y hablando

---

## 🛠️ Tecnologías Utilizadas

| Tecnología | Propósito |
|------------|-----------|
| [Flutter](https://flutter.dev/) | Framework UI multiplataforma |
| [Rasa](https://rasa.com/) | Procesamiento de lenguaje natural |
| [flutter_tts](https://pub.dev/packages/flutter_tts) | Text-to-Speech |
| [speech_to_text](https://pub.dev/packages/speech_to_text) | Speech-to-Text |
| [http](https://pub.dev/packages/http) | Cliente HTTP |

---

## 📱 Plataformas Soportadas

- ✅ Android
- ✅ iOS
- ✅ Windows
- ✅ Linux
- ✅ Web

---

## 📄 Licencia

Este proyecto está bajo la licencia MIT. Consulta el archivo [LICENSE](LICENSE) para más detalles.

---

## 🙏 Agradecimientos

- [Rasa](https://rasa.com/) por el framework de código abierto para IA conversacional
- Comunidad Flutter por los paquetes amazing

---

<div align="center">

⭐️ ¡Dale una estrella si te gusta el proyecto!

</div>
