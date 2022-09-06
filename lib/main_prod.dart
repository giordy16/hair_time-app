import 'package:flutter/cupertino.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const App(flavor: 'prod'));
}