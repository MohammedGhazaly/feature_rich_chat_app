import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:feature_rich_chat_app/core/shared/cubits/cubit/theme_cubit.dart';
import 'package:feature_rich_chat_app/core/utils/shared_pref_utils/shared_pref_manager.dart';
import 'package:feature_rich_chat_app/core/utils/themes/theme_util.dart';
import 'package:feature_rich_chat_app/features/home/presentation/view/home_view.dart';
import 'package:feature_rich_chat_app/features/home/presentation/view_model/cubit/home_cubit.dart';
import 'package:feature_rich_chat_app/features/settings/presentation/view/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedTheme = await AdaptiveTheme.getThemeMode();
  print(savedTheme?.name);
  await PrefsManager.init();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ThemeCubit>(
        create: (context) => ThemeCubit()
          ..getTheme()
          ..toggleTheme(context),
      ),
      BlocProvider<HomeCubit>(
        create: (context) => HomeCubit(),
      ),
    ],
    child: MyApp(
      savedThemeMode: savedTheme,
    ),
  ));
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;
  const MyApp({super.key, required this.savedThemeMode});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      light: ThemeUitl.appLightTheme,
      dark: ThemeUitl.appDarkTheme,
      builder: (theme, darkTheme) {
        return ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Chat App',
              darkTheme: darkTheme,
              theme: theme,
              home: child,
            );
          },
          child: HomeView(),
        );
      },
    );
  }
}
