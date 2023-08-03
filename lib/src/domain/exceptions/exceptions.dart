abstract class MyCoinsException implements Exception {
  const MyCoinsException();
}

class FailedToRemoveCoinException implements MyCoinsException {
  const FailedToRemoveCoinException();
}

class FailedToAddCoinException implements MyCoinsException {
  const FailedToAddCoinException();
}
