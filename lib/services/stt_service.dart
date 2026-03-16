
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechToTextService {
  final stt.SpeechToText _speech = stt.SpeechToText();

  Future<String?> listenOnce() async {
    bool available = await _speech.initialize(
      onStatus: (s){},
      onError: (e){},
    );
    if (!available) return null;
    await _speech.listen(
      listenFor: const Duration(seconds: 5),
      pauseFor: const Duration(seconds: 2),
      partialResults: false,
      localeId: 'es_ES',
    );
    await Future.delayed(const Duration(seconds: 5));
    await _speech.stop();
    return _speech.lastRecognizedWords;
  }
}
