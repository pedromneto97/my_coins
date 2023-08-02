import 'package:flutter/material.dart';

import 'src/my_app.dart';
import 'src/setup.dart';

void main() async {
  await setup();

  runApp(MyApp());
}
