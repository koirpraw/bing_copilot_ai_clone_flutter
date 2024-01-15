import 'package:flutter/material.dart';

class PluginIconCard extends StatelessWidget {
  const PluginIconCard({
    super.key,
    required this.imageSrc,
  });

  final String imageSrc;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          imageSrc,
          width: 36,
          height: 36,
          fit: BoxFit.cover,

          // colorBlendMode: BlendMode.colorBurn,
          semanticLabel: 'Plugin Image',
        ),
      )),
    );
  }
}
