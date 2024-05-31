
import 'package:flutter/material.dart';

class textwidget extends StatelessWidget {
  const textwidget({
    super.key,
    required this.text
  });

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: 28,
        fontWeight: FontWeight.bold),
    );
  }
}
