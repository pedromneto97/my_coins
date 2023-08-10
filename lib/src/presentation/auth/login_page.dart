import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../domain/domain.dart';
import '../../routes/app_router.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  Future<void> _onAuthSuccess(BuildContext context, AuthState _) async {
    await GetIt.I.get<CrashlyticsProvider>().setCurrentUser(FirebaseAuth.instance.currentUser!.uid);

    if (context.mounted) context.router.replace(const HomeRoute());
  }

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      actions: [
        AuthStateChangeAction<SignedIn>(_onAuthSuccess),
        AuthStateChangeAction<UserCreated>(_onAuthSuccess),
      ],
    );
  }
}
