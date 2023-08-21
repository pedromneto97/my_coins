import 'package:flutter/widgets.dart';

import '../presentation/collection_details/cubit/filter.dart';
import 'localizations.dart';

extension FilterToLocalizedText on Filter {
  /// Returns the localized text for the filter.
  String localizedText(BuildContext context) {
    final strings = context.strings;

    switch (this) {
      case Filter.all:
        return '';
      case Filter.rare:
        return strings.rareCoins;
      case Filter.missing:
        return strings.missingCoins;
    }
  }
}
