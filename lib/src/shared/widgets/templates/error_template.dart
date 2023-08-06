import 'package:flutter/material.dart';

import '../../../utils/localizations.dart';

class ErrorTemplate extends StatelessWidget {
  final VoidCallback onRetry;

  const ErrorTemplate({
    super.key,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 64,
          ),
          const SizedBox(height: 32),
          Text(
            strings.failedToLoadPage,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            strings.checkYouConnectionAndTryAgain,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: onRetry,
            child: Text(
              context.strings.tryAgain,
            ),
          ),
        ],
      ),
    );
  }
}
