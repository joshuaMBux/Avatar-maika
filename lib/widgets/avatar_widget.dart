import 'package:flutter/material.dart';

class AvatarWidget extends StatefulWidget {
  final bool isSpeaking;
  final String emotion;

  const AvatarWidget({
    super.key,
    required this.isSpeaking,
    this.emotion = 'neutral',
  });

  @override
  State<AvatarWidget> createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<AvatarWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _blink;

  @override
  void initState() {
    super.initState();
    _blink =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _blink.dispose();
    super.dispose();
  }

  String _getAvatarAsset() {
    // Si está hablando, podríamos alternar o usar una imagen específica de "hablando"
    // Pero por ahora, priorizamos la emoción
    switch (widget.emotion) {
      case 'feliz':
        return 'assets/emociones/feliz.png';
      case 'triste':
        return 'assets/emociones/triste.png';
      case 'enojada':
        return 'assets/emociones/enojada.png';
      case 'dudando':
        return 'assets/emociones/dudando.png';
      case 'sorprendida':
        return 'assets/emociones/sorprendida.png';
      case 'sonrojada':
        return 'assets/emociones/sonrojada.png';
      case 'orgullosa':
        return 'assets/emociones/orgullosa.png';
      case 'neutral':
      default:
        return 'assets/emociones/neutral.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    final opacity = widget.isSpeaking ? 1.0 : (0.9 + 0.1 * _blink.value);

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: opacity,
      child: Image.asset(
        _getAvatarAsset(),
        height: 280,
        fit: BoxFit.contain,
      ),
    );
  }
}
