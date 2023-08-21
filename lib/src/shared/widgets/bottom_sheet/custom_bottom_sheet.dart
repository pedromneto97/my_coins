import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  final String title;
  final Widget child;

  const CustomBottomSheet({
    super.key,
    required this.child,
    this.title = '',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: Navigator.of(context).pop,
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SafeArea(
            child: child,
          ),
        ],
      ),
    );
  }
}
