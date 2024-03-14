import 'package:bing_ai_clone_flutter/constants.dart';
import 'package:flutter/material.dart';

class GPT4Toggle extends StatelessWidget {
  const GPT4Toggle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2.5,
      height: 40.0,
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: kThemeColor, width: 1.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Use GPT-4',
              ),
              Switch(
                value: true,
                onChanged: (value) {
                  // Toggle GPT-4
                },
                activeColor: Colors.white,
                activeTrackColor: Colors.purple[400],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
