import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
    final route = FirebaseAuth.instance.currentUser == null ? const LoginRoute() : const HomeRoute();

    context.replaceRoute(route);
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
