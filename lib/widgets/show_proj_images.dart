import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShowProjImagesWidget {
  static void showProjectImages(BuildContext context, List<String> imageList) {
    PageController pageController = PageController();
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          Size size = MediaQuery.of(context).size;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: Icon(
                  Icons.cancel,
                  size: size.width * 0.05,
                  color: Colors.white,
                ),
              ),
              Expanded(
                  child: Stack(
                children: [
                  PageView.builder(
                    controller: pageController,
                    itemCount: imageList.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        width: size.width,
                        color: Colors.black12,
                        child: Image.asset(
                          imageList[index],
                          fit: BoxFit.contain,
                        ),
                      );
                    },
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        if (pageController.page! > 0) {
                          pageController.previousPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Container(
                        color: Colors.black12,
                        padding: const EdgeInsets.all(8),
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        if (pageController.page! < imageList.length - 1) {
                          pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Container(
                        color: Colors.black12,
                        padding: const EdgeInsets.all(8),
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ))
            ],
          );
        });
  }
}
