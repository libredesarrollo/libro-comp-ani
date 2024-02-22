import 'package:flutter/material.dart';

class ButtonAnimated extends StatefulWidget {
  const ButtonAnimated({super.key});

  @override
  State<ButtonAnimated> createState() => _ButtonAnimatedState();
}

class _ButtonAnimatedState extends State<ButtonAnimated>
    with SingleTickerProviderStateMixin {
  bool isPlaying = false;

  late AnimationController playAnimation;

  @override
  void initState() {
    playAnimation = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.purple,
      child: AnimatedIcon(
        icon: AnimatedIcons.play_pause,
        progress: playAnimation,
      ),
      onPressed: () {
        if (isPlaying) {
          playAnimation.reverse();
          isPlaying = false;
        } else {
          playAnimation.forward();
          isPlaying = true;
        }
      },
    ));
  }
}
