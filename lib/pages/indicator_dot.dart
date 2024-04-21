import 'package:flutter/material.dart';

class IndicatorDots extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const IndicatorDots({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < 3; i++)
          GestureDetector(
            onTap: () => onTap(i),
            child: Container(
              width: 10,
              height: 10,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selectedIndex == i ? Colors.blue : Colors.grey,
              ),
            ),
          ),
      ],
    );
  }
}
