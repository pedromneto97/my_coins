import 'package:flutter/material.dart';

import '../../../shared/widgets/templates/empty_page.dart';
import '../../../utils/localizations.dart';

class EmptyPublicCollections extends StatelessWidget {
  const EmptyPublicCollections({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    return EmptyPage(
      icon: Icons.extension_off_outlined,
      title: strings.noCollectionsFound,
      description: strings.createAPublicCollection,
    );
  }
}
