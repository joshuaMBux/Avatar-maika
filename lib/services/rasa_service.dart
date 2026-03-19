import 'dart:convert';
import 'package:http/http.dart' as http;
import 'config.dart';

class RasaResponse {
  final String text;
  final String emotion;

  RasaResponse({required this.text, this.emotion = 'neutral'});
}

class RasaService {
  final String endpoint = "$kRasaBaseUrl/webhooks/rest/webhook";

  Future<RasaResponse> sendMessage(String message) async {
    try {
      final res = await http.post(
        Uri.parse(endpoint),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"sender": "web_user", "message": message}),
      );

      if (res.statusCode == 200) {
        final body = jsonDecode(res.body);
        if (body is List && body.isNotEmpty && body[0]['text'] != null) {
          String fullText = body[0]['text'];

          // Extraer emoción si existe [emocion]
          String emotion = 'neutral';
          String cleanText = fullText;

          final regExp = RegExp(r'\[(\w+)\]');
          final match = regExp.firstMatch(fullText);

          if (match != null) {
            emotion = match.group(1) ?? 'neutral';
            cleanText = fullText.replaceFirst(regExp, '').trim();
          }

          return RasaResponse(text: cleanText, emotion: emotion);
        }
      }
      return RasaResponse(
          text: "Lo siento, no entendí eso 😅", emotion: 'neutral');
    } catch (e) {
      return RasaResponse(
          text: "Error de conexión con Rasa: $e", emotion: 'enojada');
    }
  }
}
