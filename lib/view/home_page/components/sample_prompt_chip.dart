import 'package:flutter/material.dart';

import '../../../constants.dart';

class SamplePromptChip extends StatelessWidget {
  final String promptText;

  const SamplePromptChip({
    Key? key,
    required this.promptText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ActionChip(
        onPressed: () {
          // Make a poem
        },
        label: Text(
          promptText,
          style: const TextStyle(color: Colors.white),
        ),
        side: BorderSide(color: kThemeColor, width: 1.0),
      ),
    );
  }
}
