import 'package:flutter/material.dart';

import '../../../shared/widgets/templates/empty_page.dart';
import '../../../utils/localizations.dart';

class EmptyCollections extends StatelessWidget {
  const EmptyCollections({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    return EmptyPage(
      icon: Icons.no_photography_outlined,
      title: strings.youDontHaveAnyCollections,
      description: strings.addACollectionToStart,
    );
  }
}
