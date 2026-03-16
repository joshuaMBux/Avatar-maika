
import 'package:flutter/material.dart';

class AvatarWidget extends StatefulWidget {
  final bool isSpeaking;
  const AvatarWidget({super.key, required this.isSpeaking});

  @override
  State<AvatarWidget> createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<AvatarWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _blink;

  @override
  void initState() {
    super.initState();
    _blink = AnimationController(vsync: this, duration: const Duration(seconds: 3))
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _blink.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final opacity = widget.isSpeaking ? 1.0 : (0.9 + 0.1 * _blink.value);
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: opacity,
      child: Image.asset(
        widget.isSpeaking ? 'assets/avatar_talk.png' : 'assets/avatar_idle.png',
        height: 260,
      ),
    );
  }
}
