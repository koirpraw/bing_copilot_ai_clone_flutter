import 'package:flutter/material.dart';

class ImageSlideContainer extends StatelessWidget {
  PageController controller = PageController();
  ImageSlideContainer({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * 0.8,
      child: PageView.builder(
          scrollDirection: Axis.horizontal,
          controller: controller,
          // physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                double value = 1.0;
                if (controller.position.haveDimensions) {
                  value = controller.page! - index;
                  value = (1 - (value.abs() * 0.3)).clamp(0.1, 1.0);
                }
                return Center(
                  child: SizedBox(
                    height: Curves.easeOut.transform(value) * 400.0,
                    child: child,
                  ),
                );
              },
              child: Container(
                  margin: const EdgeInsets.all(8.0),
                  color: Colors.white,
                  child: Center(
                      child: Card(elevation: 3, child: Text("Card$index")))),
            );
          }),
    );
  }
}
