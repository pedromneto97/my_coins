import 'package:auto_route/auto_route.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

import '../../routes/app_router.dart';
import '../../utils/localizations.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void _onSignedOut(BuildContext context) {
    context.router.popUntilRoot();
    context.router.replace(const LoginRoute());
  }

  @override
  Widget build(BuildContext context) {
    return ProfileScreen(
      appBar: AppBar(
        title: Text(context.strings.profile),
      ),
      actions: [
        SignedOutAction(_onSignedOut),
      ],
    );
  }
}
