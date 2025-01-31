import 'package:flutter/material.dart';

class ManualScreen extends StatelessWidget {
  final Color backgroundColor;
  final Widget content;

  const ManualScreen({
    super.key,
    this.backgroundColor = Colors.transparent,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key("manual-screen-container"),
      width: double.infinity,
      color: backgroundColor,
      padding: const EdgeInsets.all(40),
      child: Center(child: content),
    );
  }
}
