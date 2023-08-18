import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';

import '../domain/domain.dart';
import '../presentation/presentation.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashScreenRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: LoginRoute.page,
        ),
        AutoRoute(
          page: HomeRoute.page,
        ),
        AutoRoute(
          page: ProfileRoute.page,
        ),
        AutoRoute(
          page: CreateCollectionRoute.page,
        ),
        AutoRoute(
          page: UserCollectionsRoute.page,
        ),
        AutoRoute(
          page: CollectionDetailsRoute.page,
        ),
        AutoRoute(
          page: CoinDetailsRoute.page,
        ),
        AutoRoute(
          page: EditCollectionRoute.page,
        ),
        AutoRoute(
          page: PublicCollectionsRoute.page,
        ),
      ];
}
