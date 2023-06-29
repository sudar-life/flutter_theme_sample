import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeState> {
  ThemeCubit() : super(const ThemeState());

  void updateMode(ThemeMode mode, {bool? isSaveLocalData}) {
    if (isSaveLocalData != null && isSaveLocalData) {
      emit(
        state.copyWith(
          isDarkMode: mode == ThemeMode.dark,
          isSaveLocalData: isSaveLocalData,
        ),
      );
      return;
    }
    if (isSaveLocalData == null || !isSaveLocalData) {
      emit(
        state.copyWith(
          isDarkMode:
              state.isSaveLocalData ? state.isDarkMode : mode == ThemeMode.dark,
        ),
      );
    }
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return ThemeState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return state.toJson();
  }
}

class ThemeState extends Equatable {
  final bool isSaveLocalData;
  final bool? isDarkMode;

  const ThemeState({
    this.isDarkMode,
    this.isSaveLocalData = false,
  });

  factory ThemeState.fromJson(Map<String, dynamic> json) {
    return ThemeState(
      isDarkMode: json['isDarkMode'] as bool?,
      isSaveLocalData: json['isSaveLocalData'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isDarkMode': isDarkMode,
      'isSaveLocalData': isSaveLocalData,
    };
  }

  ThemeState copyWith({
    bool? isDarkMode,
    bool? isSaveLocalData,
  }) {
    return ThemeState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      isSaveLocalData: isSaveLocalData ?? this.isSaveLocalData,
    );
  }

  ThemeMode? get themeMode {
    return isDarkMode == null
        ? null
        : isDarkMode!
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  @override
  List<Object?> get props => [
        isDarkMode,
        isSaveLocalData,
      ];
}
