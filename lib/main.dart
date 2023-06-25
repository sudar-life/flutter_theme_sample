import 'package:flutter/material.dart';
import 'package:flutter_theme_sample/src/app.dart';
import 'package:flutter_theme_sample/src/controller/theme_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  Get.put(ThemeController(prefs), permanent: true);
  runApp(const MyApp());
}
