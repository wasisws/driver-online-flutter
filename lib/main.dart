import 'package:flutter/material.dart';
import 'package:gojek/extensions/Colors.dart';
import 'package:gojek/screens/SplashScreen.dart';

import 'package:gojek/store/AppStore.dart';
import 'package:nb_utils/nb_utils.dart';

AppStore appStore = AppStore();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialize();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: jcbPrimaryColor),
        useMaterial3: true,
      ),
    );
  }
}
