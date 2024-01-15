import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RecentActivityPage extends StatefulWidget {
  const RecentActivityPage({Key? key}) : super(key: key);

  @override
  State<RecentActivityPage> createState() => _RecentActivityPageState();
}

class _RecentActivityPageState extends State<RecentActivityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Card(
              elevation: 3,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  // Replace this with your actual data model
                  final userPrompt = 'User Prompt $index';
                  // final timeStamp = DateTime.now().toString();
                  final timeStamp = DateFormat.E().format(DateTime.now());

                  return ListTile(
                    title: Text(userPrompt),
                    trailing: Text(timeStamp),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: 10, // Replace with your actual item count
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Your Bing-AI powered copilot has auto saving for chats. '
              'You can access your chat from any device.',
            ),
          ),
        ],
      ),
    );
  }
}
