import 'package:bing_ai_clone_flutter/controller/api_controller.dart';
import 'package:flutter/material.dart';

import 'package:bing_ai_clone_flutter/view/home_page/components/chat_input_field.dart';
import 'package:bing_ai_clone_flutter/view/home_page/components/headerIntro.dart';
import 'package:bing_ai_clone_flutter/view/home_page/components/user_choice_button.dart';
import 'package:bing_ai_clone_flutter/view/home_page/components/user_greeting_conatiner.dart';

import 'package:get/get.dart';
import 'package:bing_ai_clone_flutter/constants.dart';

import 'components/gpt4_toggle.dart';
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  ApiController apiController = Get.put(ApiController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0xff303030),
        elevation: 0,
        leading: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Get.to(() => const MenuPage());
              },
            ),
          ],
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
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 24.0, 0, 16.0),
                  child: HeaderIntro(),
                ),

                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 16.0),
                //   child: Container(
                //     color: Colors.white,
                //     width: MediaQuery.of(context).size.width * 0.9,
                //     height: MediaQuery.of(context).size.height * 0.3,
                //   ),
                // ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                            color: Colors.white,
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: Center(child: Text("Card$index")));
                      }),
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Text(
                          "Copilot uses AI. Check for mistakes.",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CompanyLinks(
                            title: "Terms",
                          ),
                          Text(
                            " | ",
                            style: TextStyle(),
                          ),
                          CompanyLinks(
                            title: "Privacy",
                          ),
                          Text(" | "),
                          CompanyLinks(
                            title: "FAQ",
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                const GPT4Toggle(),

                const UserGreetingContainer(),
                Expanded(
                    flex: 1,
                    child: FutureBuilder(
                      future: ApiConnection()
                          .getResponse(apiController.promptController.text),
                      builder: (context, snapshot) {
                        return Text(snapshot.data.toString());
                      },
                    )),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: IconButton(
                            onPressed: () {
                              ApiConnection().getResponse(
                                  apiController.promptController.text);
                            },
                            icon: const Icon(
                              Icons.chat_bubble_outline_rounded,
                              color: Colors.white,
                            )),
                      ),
                      Expanded(
                        flex: 6,
                        child: ChatInputField(
                            promptController: apiController.promptController),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CompanyLinks extends StatelessWidget {
  final String title;
  const CompanyLinks({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(color: Colors.blue, fontSize: 12),
    );
  }
}
