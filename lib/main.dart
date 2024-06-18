import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:imtihon/screen/admin/views/screens/admin_main.dart';
import 'package:imtihon/screen/auth/login/login_screen.dart';
import 'package:imtihon/screen/messages/views/screens/message_page.dart';
import 'package:imtihon/screen/messages/views/screens/page_details.dart';
import 'package:imtihon/screen/splash_screen/splash_screen.dart';
import 'package:imtihon/utils/extension/extension.dart';
import 'package:imtihon/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthViewModel(),
        ),
      ],
      child: EasyLocalization(
        supportedLocales: const [
          Locale("uz"),
          Locale("en"),
          Locale("ru"),
        ],
        path: "resources/langs",
        startLocale: const Locale("ru"),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    width = context.getWidth();
    height = context.getHeight();
    return AdaptiveTheme(
      initial: AdaptiveThemeMode.light,
      light: ThemeData(brightness: Brightness.light),
      dark: ThemeData(brightness: Brightness.dark),
      builder: (lightTheme, darkTheme) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          debugShowCheckedModeBanner: false,
          locale: context.locale,
          theme: lightTheme,
          darkTheme: darkTheme,
          home: const SplashScreen(),
        );
      },

    );
  }
}
