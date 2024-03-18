import 'dart:async';

import 'package:bing_ai_clone_flutter/controller/api_controller.dart';
import 'package:bing_ai_clone_flutter/view/home_page/components/image_slide_container.dart';
import 'package:flutter/material.dart';

import 'package:bing_ai_clone_flutter/view/home_page/components/chat_input_field.dart';
import 'package:bing_ai_clone_flutter/view/home_page/components/headerIntro.dart';
import 'package:bing_ai_clone_flutter/view/home_page/components/user_choice_button.dart';
import 'package:bing_ai_clone_flutter/view/home_page/components/user_greeting_conatiner.dart';
import 'package:flutter/widgets.dart';

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

//
late PageController _controller;

class _HomePageState extends State<HomePage> {
  final _apiConnect = ApiConnection();
  final _chatInputFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 0, viewportFraction: 0.6);
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_controller.page?.round() == _controller.initialPage) {
        _controller.animateToPage(_controller.page!.round() + 1,
            duration: const Duration(milliseconds: 350), curve: Curves.easeIn);
      } else if (_controller.page?.round() == 9) {
        _controller.animateToPage(_controller.initialPage,
            duration: const Duration(milliseconds: 350), curve: Curves.easeIn);
      } else {
        _controller.animateToPage(_controller.page!.round() + 1,
            duration: const Duration(milliseconds: 350), curve: Curves.easeIn);
      }
    });
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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 7,
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
                        _chatInputFocusNode.hasFocus
                            ? const SizedBox()
                            : ImageSlideContainer(controller: _controller),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                            child: Obx(
                              () => ListView.builder(
                                  itemCount: apiController.messages.length,
                                  itemBuilder: (context, index) {
                                    final message =
                                        apiController.messages[index];
                                    return Column(
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.account_circle_rounded,
                                                  color: kThemeColor,
                                                ),
                                                const Text(
                                                  "You",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            Text(message.content),
                                          ],
                                        ),
                                        const Divider(),
                                        Column(
                                          children: [
                                            const Row(
                                              children: [
                                                Image(
                                                    image: AssetImage(
                                                        'assets/images/copilot.png'),
                                                    width: 24,
                                                    height: 24),
                                                Text(
                                                  "You",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            Text(message.content),
                                          ],
                                        ),
                                      ],
                                    );
                                  }),
                            )),
                        // Expanded(
                        //   flex: 2,
                        //   child: ListView.builder(
                        //     itemCount: apiController.messages.length,
                        //     itemBuilder: (context, index) {
                        //       return Column(
                        //         mainAxisAlignment:
                        //             MainAxisAlignment.spaceBetween,
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         children: [
                        //           Row(
                        //             children: [
                        //               Icon(
                        //                 Icons.account_circle_rounded,
                        //                 color: kThemeColor,
                        //               ),
                        //               const Text(
                        //                 "You",
                        //                 style: TextStyle(
                        //                     fontSize: 12,
                        //                     fontWeight: FontWeight.bold),
                        //               ),
                        //             ],
                        //           ),
                        //           Text(apiController.messages[index]),
                        //         ],
                        //       );
                        //     },
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: _chatInputFocusNode.hasFocus ? 2 : 1,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {
                          // ApiConnection().getResponse(
                          //     apiController.promptController.text);
                        },
                        icon: const Icon(
                          Icons.chat_bubble_outline_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 5,
                        child: TextFormField(
                          controller: apiController.promptController,
                          keyboardType: TextInputType.multiline,
                          minLines: 1,
                          maxLines: _chatInputFocusNode.hasFocus ? null : 1,
                          focusNode: _chatInputFocusNode,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide:
                                    BorderSide(color: kThemeColor, width: 1.0),
                              ),
                              filled: true,
                              fillColor: const Color(0xff303030),
                              labelText: 'Ask me anything...',
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.send,
                                  color: Colors.pink.shade100,
                                ),
                                onPressed: () {
                                  if (apiController
                                      .promptController.text.isNotEmpty) {
                                    apiController.sendMessage();
                                    apiController.promptController.clear();
                                  }
                                },
                              )),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ));
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
