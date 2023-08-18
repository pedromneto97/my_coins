import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../firebase_options.dart';
import 'data/driver/photo_driver_impl.dart';
import 'data/provider/collection/collection_provider_impl.dart';
import 'data/provider/crashlytics/crashlytics_provider_impl.dart';
import 'data/provider/photo/photo_provider_impl.dart';
import 'data/provider/template/template_provider_impl.dart';
import 'domain/domain.dart';
import 'presentation/coin_details/widgets/add_coin_to_collection/cubit/add_coin/add_coin_cubit.dart';
import 'presentation/coin_details/widgets/add_coin_to_collection/cubit/selected_photos/selected_photos_cubit.dart';
import 'presentation/coin_details/widgets/add_coin_to_collection/cubit/selected_preservation/selected_preservation_cubit.dart';
import 'presentation/coin_details/widgets/remove_coin_from_collection/cubit/remove_coin_cubit.dart';
import 'presentation/collection_details/cubit/find_collection_details_cubit.dart';
import 'presentation/create_collection/cubit/create_collection_cubit.dart';
import 'presentation/edit_collection/cubit/update_collection_cubit.dart';
import 'presentation/edit_collection/widgets/confirm_delete/cubit/delete_collection_cubit.dart';
import 'presentation/public_collections/cubit/get_public_collections_cubit.dart';
import 'presentation/user_collections/cubit/get_user_collections/get_user_collections_cubit.dart';
import 'shared/widgets/collection_form/cubit/get_templates/get_templates_cubit.dart';
import 'shared/widgets/collection_form/cubit/public_collection/public_collection_cubit.dart';
import 'shared/widgets/collection_form/cubit/selected_template/selected_template_cubit.dart';

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _setupFirebase();
  _setupProviders();
  _setupDrivers();
  _setupUseCases();
  _setupCubits();
}

Future<void> _setupFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (kDebugMode) {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  }

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  PlatformDispatcher.instance.onError = (exception, stackTrace) {
    FirebaseCrashlytics.instance.recordError(exception, stackTrace, fatal: true);

    return true;
  };

  FirebaseUIAuth.configureProviders([
    GoogleProvider(clientId: '38384210019-1ggtoqnlbt7pjrpq9ed368mn5jt0bd3t.apps.googleusercontent.com'),
  ]);
}

void _setupProviders() {
  final getIt = GetIt.I;

  getIt.registerLazySingleton<CrashlyticsProvider>(
    () => CrashlyticsProviderImpl(
      crashlytics: FirebaseCrashlytics.instance,
    ),
  );

  getIt.registerLazySingleton<TemplateProvider>(
    () => TemplateProviderImpl(
      firestore: FirebaseFirestore.instance,
      crashlytics: getIt.get(),
    ),
  );
  getIt.registerLazySingleton<CollectionProvider>(
    () => CollectionProviderImpl(
      firestore: FirebaseFirestore.instance,
      firebaseAuth: FirebaseAuth.instance,
      crashlytics: getIt.get(),
    ),
  );
  getIt.registerLazySingleton<PhotoProvider>(
    () => PhotoProviderImpl(
      storage: FirebaseStorage.instance,
      uuid: const Uuid(),
      crashlytics: getIt.get(),
      firebaseAuth: FirebaseAuth.instance,
    ),
  );
}

void _setupDrivers() {
  GetIt.I.registerFactory<PhotoDriver>(() => PhotoDriverImpl(picker: ImagePicker()));
}

void _setupUseCases() {
  final getIt = GetIt.I;

  getIt.registerFactory(
    () => AddCoinUseCase(
      collectionProvider: getIt.get(),
      photosProvider: getIt.get(),
      crashlyticsProvider: getIt.get(),
    ),
  );
  getIt.registerFactory(
    () => CreateCollectionUseCase(
      getIt.get(),
    ),
  );
  getIt.registerFactory(
    () => FindCollectionUseCase(
      collectionProvider: getIt.get(),
      templateProvider: getIt.get(),
    ),
  );
  getIt.registerFactory(
    () => GetPublicCollectionsUseCase(
      getIt.get(),
    ),
  );
  getIt.registerFactory(
    () => GetTemplatesUseCase(
      templateProvider: getIt.get(),
    ),
  );
  getIt.registerFactory(
    () => GetUserCollectionsUseCase(
      getIt.get(),
    ),
  );
  getIt.registerFactory(
    () => RemoveCoinUseCase(
      collectionProvider: getIt.get(),
      photosProvider: getIt.get(),
      crashlyticsProvider: getIt.get(),
    ),
  );
  getIt.registerFactory(
    () => TakePhotoUseCase(
      driver: getIt.get(),
    ),
  );
  getIt.registerFactory(
    () => PickPhotosUseCase(
      driver: getIt.get(),
    ),
  );
  getIt.registerFactory(
    () => UpdateCollectionUseCase(
      provider: getIt.get(),
    ),
  );
  getIt.registerFactory(
    () => DeleteCollectionUseCase(
      provider: getIt.get(),
      crashlytics: getIt.get(),
      removeCoinUseCase: getIt.get(),
    ),
  );
}

void _setupCubits() {
  final getIt = GetIt.I;

  getIt.registerFactory(
    () => GetTemplatesCubit(
      getIt.get(),
    ),
  );
  getIt.registerFactoryParam<SelectedTemplateCubit, CollectionTemplate?, void>(
    (template, _) => SelectedTemplateCubit(template: template),
  );
  getIt.registerFactoryParam<PublicCollectionCubit, bool, void>(
    (isPublic, _) => PublicCollectionCubit(isPublic: isPublic),
  );
  getIt.registerFactory<CreateCollectionCubit>(
    () => CreateCollectionCubit(
      useCase: getIt.get(),
    ),
  );
  getIt.registerFactory(
    () => GetUserCollectionsCubit(
      useCase: getIt.get(),
    ),
  );
  getIt.registerFactoryParam<FindCollectionDetailsCubit, String, void>(
    (id, _) => FindCollectionDetailsCubit(
      id: id,
      useCase: getIt.get(),
    ),
  );
  getIt.registerFactory(
    () => SelectedPhotosCubit(
      takePhotoUseCase: getIt.get(),
      pickPhotosUseCase: getIt.get(),
    ),
  );
  getIt.registerFactoryParam<AddCoinCubit, String, String>(
    (collectionId, coinId) => AddCoinCubit(
      useCase: getIt.get(),
      collectionId: collectionId,
      coinId: coinId,
    ),
  );
  getIt.registerFactory<SelectedPreservationCubit>(SelectedPreservationCubit.new);
  getIt.registerFactoryParam<RemoveCoinCubit, CollectionCoin, String>(
    (collectionCoin, collectionId) => RemoveCoinCubit(
      useCase: getIt.get(),
      coin: collectionCoin,
      collectionId: collectionId,
    ),
  );
  getIt.registerFactoryParam<UpdateCollectionCubit, Collection, void>(
    (collection, _) => UpdateCollectionCubit(
      useCase: getIt.get(),
      collection: collection,
    ),
  );
  getIt.registerFactoryParam<DeleteCollectionCubit, Collection, void>(
    (collection, _) => DeleteCollectionCubit(useCase: getIt.get(), collection: collection),
  );

  getIt.registerFactory(
    () => GetPublicCollectionsCubit(
      useCase: getIt.get(),
    ),
  );
}
