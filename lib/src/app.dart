import 'package:flutter/material.dart';
import 'package:flutter_theme_sample/src/page/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightMode,
      darkTheme: darkMode,
      home: const Home(),
    );
  }
}

ThemeData lightMode = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: const Color(0xffEAE8F4),
  textTheme: TextTheme(
    titleLarge: const TextStyle(color: Color(0xff28222B)),
    titleSmall: TextStyle(color: const Color(0xff28222B).withOpacity(0.7)),
    labelMedium: const TextStyle(color: Color(0xff9279C8)),
  ),
  cardTheme: const CardTheme(color: Color(0xffEAE8F4)),
  dividerTheme: const DividerThemeData(color: Color(0xffEAE8F4)),
  buttonTheme: const ButtonThemeData(
    colorScheme: ColorScheme.light(
      primary: Colors.white,
      primaryContainer: Color(0xff9279C8),
    ),
  ),
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.all(Colors.white),
    trackColor: MaterialStateProperty.all(
      const Color(0xff9279C8),
    ),
  ),
  iconTheme: const IconThemeData(color: Colors.black),
  drawerTheme: const DrawerThemeData(backgroundColor: Color(0xffEAE8F4)),
);
ThemeData darkMode = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: const Color(0xff28222B),
  textTheme: TextTheme(
    titleLarge: const TextStyle(color: Color(0xffDADADA)),
    titleSmall: TextStyle(color: const Color(0xffDADADA).withOpacity(0.7)),
    labelMedium: const TextStyle(color: Color(0xff8ABD93)),
  ),
  cardTheme: const CardTheme(color: Color(0xff342C38)),
  dividerTheme: const DividerThemeData(color: Color(0xff28222B)),
  buttonTheme: const ButtonThemeData(
    colorScheme: ColorScheme.dark(
      primary: Colors.white,
      primaryContainer: Color(0xff8ABD93),
    ),
  ),
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.all(Colors.black),
    trackColor: MaterialStateProperty.all(
      const Color(0xffDEDEDE),
    ),
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  drawerTheme: const DrawerThemeData(backgroundColor: Color(0xff28222B)),
);
