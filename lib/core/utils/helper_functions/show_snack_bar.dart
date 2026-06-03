import 'package:flutter/material.dart';

class ShowSnackBar extends StatelessWidget {
  const ShowSnackBar({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return SnackBar(content: Text(text));
  }
}
