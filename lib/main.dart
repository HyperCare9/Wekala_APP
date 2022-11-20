import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wekala_sales/Views/Screens/login_screen.dart';
import '../Views/Screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      startLocale: const Locale('ar', 'EG'),
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ar', 'EG'),
      ],
      saveLocale: true,
      fallbackLocale: const Locale('en', 'US'),
      path: 'assets/languages',
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      // theme: ThemeData.dark(),
      home: const LoginScreenWekala(),
    );
  }
}
