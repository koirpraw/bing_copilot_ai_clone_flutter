import 'package:flutter/material.dart';

import 'package:bing_ai_clone_flutter/view/menu_page/components/plugin_card.dart';
import 'package:get/get.dart';

import '../../model/plugin_card_model.dart';
import 'components/plugin_search_card.dart';

class PluginPage extends StatefulWidget {
  const PluginPage({Key? key}) : super(key: key);

  @override
  State<PluginPage> createState() => _PluginPageState();
}

class _PluginPageState extends State<PluginPage> {
  List<PluginCardModel> pluginCards = [
    PluginCardModel(
      imageSrc: "assets/images/instacart_icon.png",
      title: 'Instacart',
      isInstalled: false,
      description:
          'Search annd compare Price from thousands of online shops. Only available in US',
    ),
    PluginCardModel(
      imageSrc: "assets/images/instacart_icon.png",
      title: 'Klarna',
      isInstalled: false,
      description:
          'Search annd compare Price from thousands of online shops. Only available in US',
    ),
    PluginCardModel(
      imageSrc: "assets/images/google_icon.png",
      title: 'Google Search',
      isInstalled: false,
      description:
          'Search annd compare Price from thousands of online shops. Only available in US',
    ),
    PluginCardModel(
      imageSrc: "assets/images/amazon_icon.png",
      title: 'Online Shopping Assistant',
      isInstalled: false,
      description:
          'Search annd compare Price from thousands of online shops. Only available in US',
    ),
    PluginCardModel(
      imageSrc: "assets/images/linkedin_icon.png",
      title: 'LinkedIn Jobs',
      isInstalled: false,
      description:
          'Search annd compare Price from thousands of online shops. Only available in US',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Wrap(
                children: [
                  Text(
                    'Choose up yo 3 plugins for a conversation.'
                    'To change plugins after you have started a conversation select new topic',
                  ),
                ],
              ),
            ),
            const Text("Data will be shared with plugins you choose"),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: pluginCards.length,
              itemBuilder: (context, index) {
                return PluginCard(
                  imageSrc: pluginCards[index].imageSrc,
                  title: pluginCards[index].title,
                  isInstalled: pluginCards[index].isInstalled,
                  description: pluginCards[index].description,
                );
              },
            ),
            const PluginSearchCard(),
            SizedBox(
              height: Get.height * 0.1,
            )
          ],
        ),
      ),
    );
  }
}
