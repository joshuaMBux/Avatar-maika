import 'dart:convert';
import 'package:http/http.dart' as http;
import 'config.dart';

class RasaService {
  final String endpoint = "$kRasaBaseUrl/webhooks/rest/webhook";

  Future<String> sendMessage(String message) async {
    try {
      final res = await http.post(
        Uri.parse(endpoint),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"sender": "web_user", "message": message}),
      );
      if (res.statusCode == 200) {
        final body = jsonDecode(res.body);
        if (body is List && body.isNotEmpty && body[0]['text'] != null) {
          return body[0]['text'];
        }
      }
      return "Lo siento, no entendí eso 😅";
    } catch (e) {
      return "Error de conexión con Rasa: $e";
    }
  }
}
