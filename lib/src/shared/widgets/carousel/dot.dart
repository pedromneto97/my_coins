import 'package:flutter/material.dart';

class Dot extends StatelessWidget {
  final bool isSelected;

  const Dot({
    super.key,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 8,
      height: 8,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: isSelected ? theme.colorScheme.primary : theme.colorScheme.secondary,
        shape: BoxShape.circle,
      ),
    );
  }
}
