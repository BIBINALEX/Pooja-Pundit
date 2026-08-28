import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pooja_pundit/core/router/app_router.dart';

class AppColors {
  static const Color primaryColor = Color(0xFFFF6900);
  static const Color lightBaseSurface = Color(0xFFFBF8F5);
  static const Color darkBaseSurface = Color(0xFF121212);
  static const Color darkScaffold = Color(0xFF1A1A1A);
  static const Color darkTextColor = Color(0xFF2E2926);
}

class PoojaPunditApp extends StatelessWidget {
  const PoojaPunditApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Pooja Pundit',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryColor,
              onPrimary: Colors.white,
              surface: AppColors.lightBaseSurface,
              onSurface: AppColors.darkTextColor,
            ),
            scaffoldBackgroundColor: AppColors.lightBaseSurface,
            appBarTheme: const AppBarTheme(
              centerTitle: true,
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Colors.white,
            ),
          ),
          routerConfig: appRouter,
        );
      },
    );
  }
}
