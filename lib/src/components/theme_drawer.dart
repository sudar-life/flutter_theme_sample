import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme_sample/src/components/app_font.dart';
import 'package:flutter_theme_sample/src/cubit/theme_cubit.dart';

class ThemeDrawer extends StatelessWidget {
  const ThemeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.8,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppFont(
                      state.themeMode == ThemeMode.light ? '라이트 모드' : '다크 모드',
                      size: 23,
                    ),
                    Switch(
                      value: state.themeMode == ThemeMode.light,
                      onChanged: (ck) {
                        context.read<ThemeCubit>().updateMode(
                              ck ? ThemeMode.light : ThemeMode.dark,
                              isSaveLocalData: true,
                            );
                      },
                    )
                  ],
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
