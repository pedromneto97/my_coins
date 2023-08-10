abstract interface class CrashlyticsProvider {
  const CrashlyticsProvider();

  Future<void> setCurrentUser(String id);

  Future<void> recordError(
    Object exception,
    StackTrace stack, {
    String reason = '',
  });
}
