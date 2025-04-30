import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'utils/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nearby Mandirs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.mapLightGrayColor,
          primary: AppColors.mapLightGrayColor,
          secondary: AppColors.mapLightGrayColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.whiteColor,
          foregroundColor: AppColors.whiteColor,
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: AppColors.blackColor,
          unselectedLabelColor: AppColors.blackColor,
          indicatorColor: AppColors.blackColor,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: AppColors.darkGrayColor),
          bodyMedium: TextStyle(color: AppColors.darkGrayColor),
          titleLarge: TextStyle(color: AppColors.darkGrayColor),
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
