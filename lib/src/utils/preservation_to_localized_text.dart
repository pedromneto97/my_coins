import 'package:flutter/widgets.dart';

import '../domain/domain.dart';
import 'localizations.dart';

extension LocalizationExtension on Preservation {
  String toLocalizedString(BuildContext context) {
    switch (this) {
      case Preservation.uncirculated:
        return context.strings.uncirculated;
      case Preservation.extremelyFine:
        return context.strings.extremelyFine;
      case Preservation.veryFine:
        return context.strings.veryFine;
      case Preservation.fine:
        return context.strings.fine;
      case Preservation.good:
        return context.strings.good;
      case Preservation.poor:
        return context.strings.poor;
      case Preservation.unknown:
        return context.strings.unknown;
    }
  }
}
