import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'plugin_icon_card.dart';

class PluginCard extends StatelessWidget {
  final String imageSrc;
  final String title;
  final bool isInstalled;
  final String description;
  const PluginCard(
      {super.key,
      required this.imageSrc,
      required this.title,
      required this.isInstalled,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        PluginIconCard(
                          imageSrc: imageSrc,
                        ),
                        Text(title),
                      ],
                    ),
                    Switch(
                        value: isInstalled,
                        onChanged: (newVal) {
                          if (kDebugMode) {
                            print(newVal);
                          }
                        })
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 16.0),
                  child: Wrap(children: [Text(description)]),
                ),
              ]),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Terms of use',
                            style: TextStyle(color: Colors.blue),
                          )),
                      const Text("|"),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Privacy Policy',
                            style: TextStyle(color: Colors.blue),
                          )),
                      SizedBox(width: Get.width / 3),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
