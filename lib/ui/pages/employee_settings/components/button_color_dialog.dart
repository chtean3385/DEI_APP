import 'package:flutter/material.dart';

class ButtonColorDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Pick Button Color"),
      content: Wrap(
        spacing: 10,
        children: [
          _colorCircle(context, Colors.blue),
          _colorCircle(context, Colors.red),
          _colorCircle(context, Colors.green),
          _colorCircle(context, Colors.orange),
        ],
      ),
    );
  }

  Widget _colorCircle(BuildContext context, Color color) {
    return GestureDetector(
      onTap: () => Navigator.pop(context, color),
      child: CircleAvatar(
        radius: 18,
        backgroundColor: color,
      ),
    );
  }
}
