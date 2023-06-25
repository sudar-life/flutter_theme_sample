import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<bool?> {
  ThemeCubit() : super(null);

  void updateMode(ThemeMode mode) {
    emit(mode == ThemeMode.dark);
  }

  @override
  bool? fromJson(Map<String, dynamic> json) {
    return json['isDarkMode'] as bool?;
  }

  @override
  Map<String, dynamic>? toJson(bool? state) {
    return {'isDarkMode': state};
  }
}
