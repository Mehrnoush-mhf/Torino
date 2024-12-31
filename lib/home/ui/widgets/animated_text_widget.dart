import 'package:flutter/material.dart';
import 'package:torino/constants/colors.dart';

class AnimatedTextWidget extends StatefulWidget {
  final String text;
  final TextStyle? style;

  const AnimatedTextWidget({super.key, required this.text, this.style});

  @override
  _AnimatedTextWidgetState createState() => _AnimatedTextWidgetState();
}

class _AnimatedTextWidgetState extends State<AnimatedTextWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Text(
        widget.text,
        textDirection: TextDirection.rtl,
        style: widget.style ??
            TextStyle(
              fontFamily: AppTheme.fontFamilyName,
              fontSize: 24,
              color: AppTheme.textColor,
            ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
