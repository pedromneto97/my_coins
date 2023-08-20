// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CoinDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CoinDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CoinDetailsPage(
          key: args.key,
          item: args.item,
          family: args.family,
          group: args.group,
          collectionId: args.collectionId,
          canEdit: args.canEdit,
        ),
      );
    },
    CoinErrorsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CoinErrorsPage(),
      );
    },
    CollectionDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CollectionDetailsRouteArgs>(
          orElse: () => CollectionDetailsRouteArgs(id: pathParams.getString('id')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CollectionDetailsPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    CreateCollectionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateCollectionPage(),
      );
    },
    EditCollectionRoute.name: (routeData) {
      final args = routeData.argsAs<EditCollectionRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditCollectionPage(
          key: args.key,
          collection: args.collection,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfilePage(),
      );
    },
    PublicCollectionsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PublicCollectionsPage(),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreenPage(),
      );
    },
    UserCollectionsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserCollectionsPage(),
      );
    },
  };
}

/// generated route for
/// [CoinDetailsPage]
class CoinDetailsRoute extends PageRouteInfo<CoinDetailsRouteArgs> {
  CoinDetailsRoute({
    Key? key,
    required CollectionCoinWithTemplate item,
    required String family,
    required String group,
    required String collectionId,
    required bool canEdit,
    List<PageRouteInfo>? children,
  }) : super(
          CoinDetailsRoute.name,
          args: CoinDetailsRouteArgs(
            key: key,
            item: item,
            family: family,
            group: group,
            collectionId: collectionId,
            canEdit: canEdit,
          ),
          initialChildren: children,
        );

  static const String name = 'CoinDetailsRoute';

  static const PageInfo<CoinDetailsRouteArgs> page = PageInfo<CoinDetailsRouteArgs>(name);
}

class CoinDetailsRouteArgs {
  const CoinDetailsRouteArgs({
    this.key,
    required this.item,
    required this.family,
    required this.group,
    required this.collectionId,
    required this.canEdit,
  });

  final Key? key;

  final CollectionCoinWithTemplate item;

  final String family;

  final String group;

  final String collectionId;

  final bool canEdit;

  @override
  String toString() {
    return 'CoinDetailsRouteArgs{key: $key, item: $item, family: $family, group: $group, collectionId: $collectionId, canEdit: $canEdit}';
  }
}

/// generated route for
/// [CoinErrorsPage]
class CoinErrorsRoute extends PageRouteInfo<void> {
  const CoinErrorsRoute({List<PageRouteInfo>? children})
      : super(
          CoinErrorsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CoinErrorsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CollectionDetailsPage]
class CollectionDetailsRoute extends PageRouteInfo<CollectionDetailsRouteArgs> {
  CollectionDetailsRoute({
    Key? key,
    required String id,
    List<PageRouteInfo>? children,
  }) : super(
          CollectionDetailsRoute.name,
          args: CollectionDetailsRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'CollectionDetailsRoute';

  static const PageInfo<CollectionDetailsRouteArgs> page = PageInfo<CollectionDetailsRouteArgs>(name);
}

class CollectionDetailsRouteArgs {
  const CollectionDetailsRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final String id;

  @override
  String toString() {
    return 'CollectionDetailsRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [CreateCollectionPage]
class CreateCollectionRoute extends PageRouteInfo<void> {
  const CreateCollectionRoute({List<PageRouteInfo>? children})
      : super(
          CreateCollectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateCollectionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditCollectionPage]
class EditCollectionRoute extends PageRouteInfo<EditCollectionRouteArgs> {
  EditCollectionRoute({
    Key? key,
    required Collection collection,
    List<PageRouteInfo>? children,
  }) : super(
          EditCollectionRoute.name,
          args: EditCollectionRouteArgs(
            key: key,
            collection: collection,
          ),
          initialChildren: children,
        );

  static const String name = 'EditCollectionRoute';

  static const PageInfo<EditCollectionRouteArgs> page = PageInfo<EditCollectionRouteArgs>(name);
}

class EditCollectionRouteArgs {
  const EditCollectionRouteArgs({
    this.key,
    required this.collection,
  });

  final Key? key;

  final Collection collection;

  @override
  String toString() {
    return 'EditCollectionRouteArgs{key: $key, collection: $collection}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PublicCollectionsPage]
class PublicCollectionsRoute extends PageRouteInfo<void> {
  const PublicCollectionsRoute({List<PageRouteInfo>? children})
      : super(
          PublicCollectionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PublicCollectionsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreenPage]
class SplashScreenRoute extends PageRouteInfo<void> {
  const SplashScreenRoute({List<PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserCollectionsPage]
class UserCollectionsRoute extends PageRouteInfo<void> {
  const UserCollectionsRoute({List<PageRouteInfo>? children})
      : super(
          UserCollectionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserCollectionsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
