abstract class MyCoinsException implements Exception {
  const MyCoinsException();
}

class FailedToRemoveCoinException implements MyCoinsException {
  const FailedToRemoveCoinException();
}

class FailedToAddCoinException implements MyCoinsException {
  const FailedToAddCoinException();
}

class TemplateNotFoundException implements MyCoinsException {
  const TemplateNotFoundException();
}

class FailedToGetTemplatesException implements MyCoinsException {
  const FailedToGetTemplatesException();
}

class FailedToCreateCollectionException implements MyCoinsException {
  const FailedToCreateCollectionException();
}

class FailedToDeleteCollectionException implements MyCoinsException {
  const FailedToDeleteCollectionException();
}

class CollectionNotFoundException implements MyCoinsException {
  const CollectionNotFoundException();
}

class FailedToGetPublicCollectionsException implements MyCoinsException {
  const FailedToGetPublicCollectionsException();
}

class FailedToGetUserCollectionsException implements MyCoinsException {
  const FailedToGetUserCollectionsException();
}

class FailedToUpdateCollectionException implements MyCoinsException {
  const FailedToUpdateCollectionException();
}

class FailedToAddCoinToCollectionException implements MyCoinsException {
  const FailedToAddCoinToCollectionException();
}

class FailedToRemoveCoinFromCollectionException implements MyCoinsException {
  const FailedToRemoveCoinFromCollectionException();
}

class FailedToDeletePhotoException implements MyCoinsException {
  const FailedToDeletePhotoException();
}

class FailedToStorePhotoException implements MyCoinsException {
  const FailedToStorePhotoException();
}
