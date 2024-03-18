import 'package:bing_ai_clone_flutter/controller/api_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ImageSlideContainer extends StatelessWidget {
  PageController controller = PageController();
  ImageSlideContainer({
    super.key,
    required this.controller,
  });
  final ApiController apiController = Get.put(ApiController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * 0.75,
      child: PageView.builder(
          scrollDirection: Axis.horizontal,
          controller: controller,
          // physics: const NeverScrollableScrollPhysics(),
          itemCount: apiController.promptImages.length,
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
              child: Stack(children: [
                Positioned(
                  child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      color: Colors.white,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image(
                          image: NetworkImage(
                            apiController.promptImages[index],
                          ),
                          fit: BoxFit.cover,
                          // colorBlendMode: BlendMode.colorBurn,
                          semanticLabel: 'Prompt Image',
                        ),
                      )),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  left: 8,
                  child: Card(
                    color: Colors.grey.shade800,
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        "Search Images",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ]),
            );
          }),
    );
  }
}
