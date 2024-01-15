import 'package:flutter/material.dart';

import 'recent_activity_page.dart';
import 'plugin_page.dart';
import 'package:get/get.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff303030),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            // Navigate back to home page
            Get.back();
          },
        ),
        title: const Text('Menu'),
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            indicatorColor: Colors.purple,
            tabs: const [
              Tab(text: 'Recent Activity'),
              Tab(text: 'Plugins'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                RecentActivityPage(),
                PluginPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
