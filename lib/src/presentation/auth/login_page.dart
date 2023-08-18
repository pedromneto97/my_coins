import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:vector_graphics/vector_graphics.dart';

import '../../domain/domain.dart';
import '../../routes/app_router.dart';
import '../../shared/assets/svg_assets.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  Future<void> _onAuthSuccess(BuildContext context, AuthState _) async {
    await GetIt.I.get<CrashlyticsProvider>().setCurrentUser(FirebaseAuth.instance.currentUser!.uid);

    if (context.mounted) context.router.replace(const HomeRoute());
  }

  Future<void> _onAuthFailed(BuildContext context, AuthFailed state) async {
    StackTrace? stackTrace;
    if (state.exception is FirebaseAuthException) {
      stackTrace = (state.exception as FirebaseAuthException).stackTrace;
    }

    await GetIt.I.get<CrashlyticsProvider>().recordError(
          state.exception,
          stackTrace,
          reason: '[LoginPage] Failed to authenticate',
        );
  }

  @override
  Widget build(BuildContext context) {
    const logoSize = 160.0;

    return SignInScreen(
      actions: [
        AuthStateChangeAction<SignedIn>(_onAuthSuccess),
        AuthStateChangeAction<UserCreated>(_onAuthSuccess),
        AuthStateChangeAction<AuthFailed>(_onAuthFailed),
      ],
      headerBuilder: (context, constraints, shrinkOffset) => Center(
        child: SvgPicture(
          const AssetBytesLoader(SvgAssets.logo),
          height: logoSize,
          width: logoSize,
          colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.secondary, BlendMode.srcIn),
        ),
      ),
      showAuthActionSwitch: false,
      headerMaxExtent: MediaQuery.of(context).size.height / 3,
    );
  }
}
