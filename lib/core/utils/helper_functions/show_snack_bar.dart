import 'package:flutter/material.dart';

class ShowBar extends StatelessWidget {
  const ShowBar({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return SnackBar(content: Text(text));
  }
}
