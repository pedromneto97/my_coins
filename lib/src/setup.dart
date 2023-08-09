import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../firebase_options.dart';
import 'data/driver/photo_driver_impl.dart';
import 'data/provider/collection/collection_provider_impl.dart';
import 'data/provider/photo/photo_provider_impl.dart';
import 'data/provider/template/template_provider_impl.dart';
import 'domain/domain.dart';
import 'presentation/coin_details/widgets/add_coin_to_collection/cubit/add_coin/add_coin_cubit.dart';
import 'presentation/coin_details/widgets/add_coin_to_collection/cubit/selected_photos/selected_photos_cubit.dart';
import 'presentation/coin_details/widgets/add_coin_to_collection/cubit/selected_preservation/selected_preservation_cubit.dart';
import 'presentation/coin_details/widgets/remove_coin_from_collection/cubit/remove_coin_cubit.dart';
import 'presentation/collection_details/cubit/find_collection_details_cubit.dart';
import 'presentation/create_collection/cubit/create_collection_cubit.dart';
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

  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
    GoogleProvider(clientId: '38384210019-1ggtoqnlbt7pjrpq9ed368mn5jt0bd3t.apps.googleusercontent.com'),
  ]);
}

void _setupProviders() {
  final getIt = GetIt.I;

  getIt.registerLazySingleton<TemplateProvider>(
    () => TemplateProviderImpl(
      firestore: FirebaseFirestore.instance,
    ),
  );
  getIt.registerLazySingleton<CollectionProvider>(
    () => CollectionProviderImpl(
      firestore: FirebaseFirestore.instance,
      firebaseAuth: FirebaseAuth.instance,
    ),
  );
  getIt.registerLazySingleton<PhotoProvider>(
    () => PhotoProviderImpl(
      storage: FirebaseStorage.instance,
      uuid: const Uuid(),
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
      collectionProvider: getIt(),
      photosProvider: getIt(),
    ),
  );
  getIt.registerFactory(
    () => CreateCollectionUseCase(
      getIt(),
    ),
  );
  getIt.registerFactory(
    () => FindCollectionUseCase(
      collectionProvider: getIt(),
      templateProvider: getIt(),
    ),
  );
  getIt.registerFactory(
    () => GetPublicCollectionsUseCase(
      getIt(),
    ),
  );
  getIt.registerFactory(
    () => GetTemplatesUseCase(
      templateProvider: getIt(),
    ),
  );
  getIt.registerFactory(
    () => GetUserCollectionsUseCase(
      getIt(),
    ),
  );
  getIt.registerFactory(
    () => RemoveCoinUseCase(
      collectionProvider: getIt(),
      photosProvider: getIt(),
    ),
  );
  getIt.registerFactory(
    () => TakePhotoUseCase(
      driver: getIt(),
    ),
  );
  getIt.registerFactory(
    () => PickPhotosUseCase(
      driver: getIt(),
    ),
  );
}

void _setupCubits() {
  final getIt = GetIt.I;

  getIt.registerFactory(
    () => GetTemplatesCubit(
      getIt(),
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
}
