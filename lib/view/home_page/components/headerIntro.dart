import 'package:flutter/material.dart';

class HeaderIntro extends StatelessWidget {
  const HeaderIntro({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/copilot.png'),
              width: 48,
              height: 48,
            ),
            SizedBox(width: 8),
            Text(
              'Copilot',
              style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Text(
          'Your Everyday AI Companion',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ],
    );
  }
}
