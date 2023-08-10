import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import '../../../domain/domain.dart';

class CrashlyticsProviderImpl implements CrashlyticsProvider {
  final FirebaseCrashlytics _crashlytics;

  const CrashlyticsProviderImpl({
    required FirebaseCrashlytics crashlytics,
  }) : _crashlytics = crashlytics;

  @override
  Future<void> recordError(
    Object exception,
    StackTrace? stackTrace, {
    String reason = '',
  }) =>
      _crashlytics.recordError(
        exception,
        stackTrace,
        reason: reason,
      );

  @override
  Future<void> setCurrentUser(String id) => _crashlytics.setUserIdentifier(id);
}
