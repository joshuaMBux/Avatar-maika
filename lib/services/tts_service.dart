
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeechService {
  final FlutterTts _tts = FlutterTts();

  Future<void> speak(String text) async {
    await _tts.setLanguage("es-MX"); // español latino
    // Algunas plataformas web ignoran setVoice si no existe la voz exacta
    await _tts.setVoice({"name": "es-MX", "locale": "es-MX"});
    await _tts.setPitch(1.08);
    await _tts.setSpeechRate(0.95);
    await _tts.speak(text);
  }
}
