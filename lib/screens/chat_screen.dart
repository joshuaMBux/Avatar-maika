import 'package:flutter/material.dart';
import '../services/rasa_service.dart';
import '../services/stt_service.dart';
import '../services/tts_service.dart';
import '../widgets/avatar_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final RasaService rasa = RasaService();
  final SpeechToTextService stt = SpeechToTextService();
  final TextToSpeechService tts = TextToSpeechService();

  bool isSpeaking = false;
  String currentEmotion = 'neutral';
  final TextEditingController _ctrl = TextEditingController();
  String botReply = "¡Hola! Soy tu avatar anime 🌸 ¿En qué te ayudo?";

  Future<void> _send(String text) async {
    if (text.trim().isEmpty) return;

    // Comando de prueba manual: /test emocion
    if (text.startsWith('/test ')) {
      String emo = text.replaceFirst('/test ', '').trim();
      setState(() {
        currentEmotion = emo;
        botReply = "Cambiando a emoción: $emo";
      });
      _ctrl.clear();
      return;
    }

    // Limpiar campo de texto
    _ctrl.clear();

    setState(() {
      isSpeaking = true;
    });

    final response = await rasa.sendMessage(text);

    setState(() {
      botReply = response.text;
      currentEmotion = response.emotion;
    });

    await tts.speak(response.text);

    setState(() {
      isSpeaking = false;
    });
  }

  Future<void> _voice() async {
    final heard = await stt.listenOnce();
    if (heard != null && heard.isNotEmpty) {
      _ctrl.text = heard;
      await _send(heard);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('🤖 Avatar IA Anime (Web)')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 8),
                AvatarWidget(
                  isSpeaking: isSpeaking,
                  emotion: currentEmotion,
                ),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.pink.shade50,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Text(
                    botReply,
                    style: const TextStyle(fontSize: 18, color: Colors.black87),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _ctrl,
                        decoration: InputDecoration(
                          hintText: "Escribe tu mensaje...",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                        ),
                        onSubmitted: _send,
                      ),
                    ),
                    const SizedBox(width: 10),
                    CircleAvatar(
                      backgroundColor: Colors.pinkAccent,
                      child: IconButton(
                        icon: const Icon(Icons.send, color: Colors.white),
                        onPressed: () => _send(_ctrl.text),
                      ),
                    ),
                    const SizedBox(width: 10),
                    CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      child: IconButton(
                        icon: const Icon(Icons.mic, color: Colors.white),
                        onPressed: _voice,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
