import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../domain/domain.dart';
import '../../routes/app_router.dart';

@RoutePage()
class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => _checkAuthAndRedirect());
  }

  void _checkAuthAndRedirect() {
    if (_isAuthenticated()) {
      return _setCurrentIdAndRedirect();
    }

    context.replaceRoute(const LoginRoute());
  }

  bool _isAuthenticated() => _getCurrentUser() != null;

  User? _getCurrentUser() => FirebaseAuth.instance.currentUser;

  void _setCurrentIdAndRedirect() {
    GetIt.I.get<CrashlyticsProvider>().setCurrentUser(_getCurrentUser()!.uid);
    context.replaceRoute(const HomeRoute());
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        Icons.add_task_rounded,
      ),
    );
  }
}
