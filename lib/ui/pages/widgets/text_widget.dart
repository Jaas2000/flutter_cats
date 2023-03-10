import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;

  const TextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontFamily: 'TitilliumWeb',
        fontWeight: FontWeight.w600,
      ),
    );
  }
}