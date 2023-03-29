import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterhw/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData.light(useMaterial3: true).copyWith(
                appBarTheme: const AppBarTheme(
                    color: Colors.transparent,
                    shadowColor: Colors.transparent,
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarIconBrightness: Brightness.dark,
                        statusBarBrightness: Brightness.light)),
              ),
              darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
                appBarTheme: const AppBarTheme(
                    color: Colors.transparent,
                    shadowColor: Colors.transparent,
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarIconBrightness: Brightness.dark,
                        statusBarBrightness: Brightness.light),
                    foregroundColor: Colors.black),
              ),
              themeMode: currentMode,
              home: Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background.jpg'),
                      fit: BoxFit.cover),
                ),
                child: const Home(title: 'Menu'),
              ));
        });
  }
}
