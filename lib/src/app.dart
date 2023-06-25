import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme_sample/src/cubit/theme_cubit.dart';
import 'package:flutter_theme_sample/src/page/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  void initThemeMode(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    context.read<ThemeCubit>().updateMode(
        brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: Builder(builder: (context) {
        initThemeMode(context);
        return BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: lightMode,
              darkTheme: darkMode,
              themeMode: state.themeMode,
              home: const Home(),
            );
          },
        );
      }),
    );
  }
}

ThemeData lightMode = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: const Color(0xffEAE8F4),
  textTheme: TextTheme(
    titleLarge: const TextStyle(color: Color(0xff28222B)),
    titleSmall: TextStyle(color: const Color(0xff28222B).withOpacity(0.7)),
    labelLarge: const TextStyle(color: Colors.white),
    displayMedium: const TextStyle(color: Color(0xff9279C8)),
  ),
  colorScheme: const ColorScheme.light(
    primary: Color(0xffEAE8F4),
    secondary: Colors.white,
  ),
  buttonTheme: const ButtonThemeData(
    colorScheme: ColorScheme.light(
      primary: Color(0xff9279C8),
    ),
  ),
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.all(Colors.white),
    trackColor: MaterialStateProperty.all(
      const Color(0xff9279C8),
    ),
  ),
  iconTheme: const IconThemeData(color: Colors.black),
);
ThemeData darkMode = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: const Color(0xff28222B),
  textTheme: TextTheme(
    titleLarge: const TextStyle(color: Color(0xffDADADA)),
    titleSmall: TextStyle(color: const Color(0xffDADADA).withOpacity(0.7)),
    labelLarge: const TextStyle(color: Colors.white),
    displayMedium: const TextStyle(color: Color(0xff8ABD93)),
  ),
  colorScheme: const ColorScheme.dark(
    primary: Color(0xff28222B),
    secondary: Color(0xff342C38),
  ),
  buttonTheme: const ButtonThemeData(
    colorScheme: ColorScheme.dark(
      primary: Color(0xff8ABD93),
    ),
  ),
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.all(Colors.black),
    trackColor: MaterialStateProperty.all(
      const Color(0xffDEDEDE),
    ),
  ),
  iconTheme: const IconThemeData(color: Colors.white),
);
