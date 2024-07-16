import 'package:feature_rich_chat_app/core/shared/cubits/cubit/theme_cubit.dart';
import 'package:feature_rich_chat_app/core/shared/cubits/cubit/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = ThemeCubit.get(context);
    return Scaffold(
      body: Center(
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return Card(
              child: SwitchListTile(
                secondary: AnimatedSwitcher(
                  duration: Duration(milliseconds: 350),
                  transitionBuilder: (child, anim) => RotationTransition(
                    turns: child.key == ValueKey('icon1')
                        ? Tween<double>(begin: 1, end: 0.75).animate(anim)
                        : Tween<double>(begin: 0.75, end: 1).animate(anim),
                    child: ScaleTransition(scale: anim, child: child),
                  ),
                  child: themeCubit.isDarkTheme
                      ? Icon(Icons.dark_mode, key: const ValueKey('icon1'))
                      : Icon(
                          Icons.wb_sunny,
                          key: const ValueKey('icon2'),
                        ),
                ),
                title: Text(
                  themeCubit.isDarkTheme ? "Dark mode" : "Light mode",
                ),
                value: themeCubit.isDarkTheme,
                onChanged: (value) {
                  themeCubit.isDarkTheme = value;
                  themeCubit.toggleTheme(context);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
