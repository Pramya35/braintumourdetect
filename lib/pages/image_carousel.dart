import 'package:flutter/material.dart';
import 'box_widget.dart';

class ImageCarousel extends StatelessWidget {
  final PageController pageController;
  final ValueChanged<int> onIndexChanged;

  const ImageCarousel({
    Key? key,
    required this.pageController,
    required this.onIndexChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: PageView(
        controller: pageController,
        onPageChanged: onIndexChanged,
        children: [
          BoxWidget(title: 'Signs & Symptoms'),
          BoxWidget(title: 'Precautions'),
          BoxWidget(title: 'Treatment'),
        ],
      ),
    );
  }
}
