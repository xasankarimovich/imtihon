import 'package:flutter/material.dart';
import 'package:imtihon/screen/splash_screen/splash_screen.dart';
import 'package:imtihon/utils/extension/extension.dart';
import 'package:imtihon/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthViewModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    width = context.getWidth();
    height = context.getHeight();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}



