import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';
import 'nearby_mandir_screen.dart';
import '../utils/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NearbyMandirScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/temple_icon.svg',
                height: screenSize.height * 0.2, // Responsive sizing
                width: screenSize.width * 0.3,
                colorFilter: const ColorFilter.mode(
                    AppColors.saffronOrangeColor, BlendMode.srcIn),
              ),
              SizedBox(height: screenSize.height * 0.03),
              Text(
                'Nearby Mandirs',
                style: TextStyle(
                  fontSize: screenSize.width * 0.07,
                  fontWeight: FontWeight.bold,
                  color: AppColors.saffronOrangeColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
