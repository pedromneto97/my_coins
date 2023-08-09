import 'package:flutter/material.dart';

class ValueWithLabel extends StatelessWidget {
  final Widget label;
  final String value;

  const ValueWithLabel({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final bodyLarge = Theme.of(context).textTheme.bodyLarge!;

    return Row(
      children: [
        DefaultTextStyle(
          style: bodyLarge.copyWith(
            fontWeight: FontWeight.bold,
          ),
          child: label,
        ),
        const SizedBox(width: 8),
        Text(
          value,
          style: bodyLarge,
        ),
      ],
    );
  }
}
