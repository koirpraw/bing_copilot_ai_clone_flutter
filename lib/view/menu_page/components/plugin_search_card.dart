import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PluginSearchCard extends StatelessWidget {
  const PluginSearchCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        color: Colors.white,
                        elevation: 3,
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/images/search_icon.png",
                            width: 36,
                            height: 36,
                            fit: BoxFit.cover,

                            // colorBlendMode: BlendMode.colorBurn,
                            semanticLabel: 'Plugin Image',
                          ),
                        )),
                      ),
                      const Text("Search")
                    ],
                  ),
                  Switch(
                      value: false,
                      onChanged: (newVal) {
                        if (kDebugMode) {
                          print("Switched to $newVal");
                        }
                      }),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8, bottom: 16.0),
                child: Wrap(children: [
                  Text(
                      "Enhance you search with the power of web including images, videos, news, and more.")
                ]),
              ),
              const Divider(
                thickness: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          // Open search
                        },
                        child: const Text('Terms of Use'),
                      ),
                      const Text(
                        "|",
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextButton(
                        onPressed: () {
                          // Open search
                        },
                        child: const Text('Privacy Policy'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: Get.width / 4,
                      )
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
