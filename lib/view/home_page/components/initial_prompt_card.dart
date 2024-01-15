import 'package:flutter/material.dart';

class InitialPromptCard extends StatelessWidget {
  final Icon icon;
  final String text;

  const InitialPromptCard({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: Colors.purple.shade100, width: 1.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: icon,
            ),
            Flexible(
              child: Text(text),
            ),
          ],
        ),
      ),
    );
  }
}
