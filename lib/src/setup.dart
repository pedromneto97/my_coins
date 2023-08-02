import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/widgets.dart';

import '../firebase_options.dart';

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _setupFirebase();
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
