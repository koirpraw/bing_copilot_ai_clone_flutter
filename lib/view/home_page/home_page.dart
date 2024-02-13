import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bing_ai_clone_flutter/constants.dart';

import 'components/initial_prompt_card.dart';
import 'components/sample_prompt_chip.dart';
import '../../constants.dart';
import '../menu_page/menu_page.dart';
import 'package:bing_ai_clone_flutter/api/api_connect.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController promptController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    promptController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0xff303030),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Get.to(() => const MenuPage());
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz_rounded),
            onPressed: () {
              // Open search
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Column(
                children: [
                  Text(
                    'Copilot,',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'with Bing',
                    style: TextStyle(
                      fontSize: 8.0,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Copilot is powered by AI, so surprises and mistakes are possible.',
                    textAlign: TextAlign.center,
                    // style: TextStyle(fontSize: 8.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Go to terms page
                        },
                        child: Text(
                          'Terms',
                          style: TextStyle(fontSize: 12, color: kThemeColor),
                        ),
                      ),
                      const Text("|"),
                      TextButton(
                        onPressed: () {
                          // Go to privacy page
                        },
                        child: Text(
                          'Privacy',
                          style: TextStyle(fontSize: 12, color: kThemeColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
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
                  ),
                  const Text(
                    'Some ideas to get you started',
                  ),
                ],
              ),
              const Expanded(
                flex: 3,
                child: Column(children: [
                  InitialPromptCard(
                      icon: Icon(Icons.airplanemode_active),
                      text: 'What is the best way to travel to Europe?'),
                  InitialPromptCard(
                      icon: Icon(Icons.umbrella),
                      text:
                          'Write a short essay that analyzes the merits of universal basic income'),
                  InitialPromptCard(
                      icon: Icon(Icons.food_bank),
                      text:
                          'Where should I travel if I have pollen allergies?'),
                ]),
              ),
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: kThemeColor, width: 1.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Happy to see you! I\'ve learned a lot from you, what should we explore next?',
                    ),
                  ),
                ),
              ),
              const Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SamplePromptChip(
                      promptText: 'Make a poem',
                    ),
                    SamplePromptChip(
                      promptText: 'Tell me a fact',
                    ),
                    SamplePromptChip(
                      promptText: 'tell me a joke',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: IconButton(
                          onPressed: () {
                            // ApiConnection().getResponse(promptController.text);
                          },
                          icon: const Icon(
                            Icons.chat_bubble_outline_rounded,
                            color: Colors.white,
                          )),
                    ),
                    Expanded(
                      flex: 6,
                      child: TextFormField(
                        controller: promptController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                                BorderSide(color: kThemeColor, width: 1.0),
                          ),
                          hintText: 'Ask me anything...',
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                          suffixIcon: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.pink.shade100,
                                ),
                                onPressed: () {
                                  // Send message
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.mic),
                                onPressed: () {
                                  // Send message
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
