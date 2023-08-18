import 'package:flutter/material.dart';

import '../../../utils/localizations.dart';

class EmptyCollections extends StatelessWidget {
  const EmptyCollections({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.no_photography_outlined,
            size: 100,
          ),
          const SizedBox(height: 24),
          Text(
            context.strings.youDontHaveAnyCollections,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            context.strings.addACollectionToStart,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
