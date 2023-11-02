import 'package:flutter/material.dart';

class TextAnimation extends StatefulWidget {
  const TextAnimation ({
    super.key,
    required this.text,
  });

  final String text;

  @override
  State <TextAnimation> createState() => _TextAnimationState();
}

class _TextAnimationState extends State <TextAnimation> with SingleTickerProviderStateMixin {
  
  late AnimationController _controller;
  late Animation <int> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _colorAnimation = IntTween(begin: 230, end: 200).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _colorAnimation,
        builder: (context, child) {
          return FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              widget.text,
              style: TextStyle(
                color: Color.fromARGB(255,  _colorAnimation.value, _colorAnimation.value, _colorAnimation.value),
                fontFamily: "Roboto Condensed",
                fontWeight: FontWeight.normal,
                fontSize: 15,
                letterSpacing: 0,
              ),
            ),
          );
        },
      ),
    );
  }
}