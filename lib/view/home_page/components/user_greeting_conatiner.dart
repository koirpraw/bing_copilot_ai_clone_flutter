import "package:bing_ai_clone_flutter/view/home_page/components/user_choice_button.dart";
import "package:flutter/material.dart";

class UserGreetingContainer extends StatelessWidget {
  const UserGreetingContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(
              image: AssetImage('assets/images/copilot.png'),
              width: 24,
              height: 24,
            ),
            SizedBox(width: 8),
            Text(
              'Copilot',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          "Hello again! I'm glad we can keep chatting. What do you want to explore today?",
          style: TextStyle(fontSize: 16),
        ),
        Row(
          children: [
            UserChoiceButton(
              userIcon: Icons.thumb_up_alt_outlined,
            ),
            UserChoiceButton(
              userIcon: Icons.thumb_down_alt_outlined,
            ),
            UserChoiceButton(
              userIcon: Icons.copy,
            ),
          ],
        )
      ],
    );
  }
}
