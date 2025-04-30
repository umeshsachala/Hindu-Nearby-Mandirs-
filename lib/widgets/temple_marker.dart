import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/app_colors.dart';

class TempleMarker extends StatelessWidget {
  const TempleMarker({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final markerSize =
        screenSize.width * 0.1; // Responsive size based on screen width

    return Container(
      width: markerSize,
      height: markerSize,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.semiTransparentBlack,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SvgPicture.asset(
        'assets/temple_marker.svg',
        colorFilter: const ColorFilter.mode(
            AppColors.saffronOrangeColor, BlendMode.srcIn),
      ),
    );
  }
}
