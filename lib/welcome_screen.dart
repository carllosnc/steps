import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final Color backgroundColor;
  final Widget content;

  const WelcomeScreen({
    super.key,
    this.backgroundColor = Colors.transparent,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: backgroundColor,
      padding: const EdgeInsets.all(40),
      child: Center(child: content),
    );
  }
}
