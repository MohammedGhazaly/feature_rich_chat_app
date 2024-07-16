import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:bloc/bloc.dart';
import 'package:feature_rich_chat_app/core/shared/cubits/cubit/theme_state.dart';
import 'package:feature_rich_chat_app/core/utils/themes/theme_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  ThemeUitl themeUitl = ThemeUitl();
  bool isDarkTheme = false;

  static ThemeCubit get(context) => BlocProvider.of(context);

  Future<void> getTheme() async {
    final savedTheme = await AdaptiveTheme.getThemeMode();
    if (savedTheme == null || savedTheme == AdaptiveThemeMode.light) {
      isDarkTheme = false;
    } else {
      isDarkTheme = true;
    }
  }

  Future<void> toggleTheme(BuildContext context) async {
    if (isDarkTheme) {
      AdaptiveTheme.of(context).setDark();
    } else {
      AdaptiveTheme.of(context).setLight();
    }
  }
}
