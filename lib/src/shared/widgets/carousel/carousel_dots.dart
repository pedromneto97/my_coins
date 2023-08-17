import 'package:flutter/material.dart';

import 'dot.dart';

class CarouselDots extends StatelessWidget {
  final int currentIndex;
  final int itemCount;

  const CarouselDots({
    super.key,
    required this.currentIndex,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[];
    for (var i = 0; i < itemCount; i++) {
      items.addAll([
        Dot(isSelected: i == currentIndex),
        if (i != itemCount - 1) const SizedBox(width: 4),
      ]);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: items,
    );
  }
}
