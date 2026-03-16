
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
  final TextEditingController _ctrl = TextEditingController();
  String botReply = "¡Hola! Soy tu avatar anime 🌸 ¿En qué te ayudo?";

  Future<void> _send(String text) async {
    if (text.trim().isEmpty) return;
    setState(() => isSpeaking = true);
    final reply = await rasa.sendMessage(text);
    setState(() => botReply = reply);
    await tts.speak(reply);
    setState(() => isSpeaking = false);
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
                AvatarWidget(isSpeaking: isSpeaking),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.pink.shade50,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    botReply,
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _ctrl,
                        decoration: const InputDecoration(
                          labelText: "Escribe tu mensaje...",
                          border: OutlineInputBorder(),
                        ),
                        onSubmitted: _send,
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(onPressed: () => _send(_ctrl.text), child: const Text("Enviar")),
                    const SizedBox(width: 8),
                    ElevatedButton(onPressed: _voice, child: const Text("🎤 Hablar")),
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
