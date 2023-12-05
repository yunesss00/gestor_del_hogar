import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'config/config.dart';
import 'firebase_options.dart';

void main() async {
  await Environment.initEnviroment();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: AppTheme().getTheme(),
    );
  }

}
