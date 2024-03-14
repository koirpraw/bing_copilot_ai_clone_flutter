import 'package:flutter/material.dart';

class UserChoiceButton extends StatelessWidget {
  final IconData userIcon;
  const UserChoiceButton({
    super.key,
    required this.userIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: Colors.grey.shade500, width: 1.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          userIcon,
          color: Colors.grey.shade500,
        ),
      ),
    );
  }
}
