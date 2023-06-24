import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_theme_sample/src/components/app_font.dart';

class ThemeDrawer extends StatefulWidget {
  ThemeDrawer({super.key});

  @override
  State<ThemeDrawer> createState() => _ThemeDrawerState();
}

class _ThemeDrawerState extends State<ThemeDrawer> {
  bool isLightMode = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      width: MediaQuery.of(context).size.width * 0.8,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppFont(
                    '라이트 모드',
                    size: 23,
                  ),
                  Switch(
                    value: isLightMode,
                    onChanged: (ck) {
                      setState(() {
                        isLightMode = ck;
                      });
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
