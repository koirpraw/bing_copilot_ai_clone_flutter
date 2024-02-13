import 'package:bing_ai_clone_flutter/view/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark(),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
