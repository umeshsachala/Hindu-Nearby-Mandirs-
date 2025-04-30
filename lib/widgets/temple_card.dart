import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class TempleCard extends StatelessWidget {
  final String name;
  final String distance;
  final bool hasLiveDarshan;

  const TempleCard({
    super.key,
    required this.name,
    required this.distance,
    this.hasLiveDarshan = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Card(
      color: AppColors.whiteColor,
      margin: EdgeInsets.symmetric(horizontal: screenSize.width * 0.03, vertical: screenSize.height * 0.004),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppColors.extraLightGrayColor),
      ),
      child: Padding(
        padding: EdgeInsets.all(screenSize.width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: 18 * textScaleFactor,
                      fontWeight: FontWeight.w500,
                      color: AppColors.darkGrayColor,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(width: screenSize.width * 0.02),
                Text(
                  distance,
                  style: TextStyle(
                    fontSize: 16 * textScaleFactor,
                    color: AppColors.lightGrayColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenSize.height * 0.01),
            Text(
              'Open till 9:00 PM',
              style: TextStyle(
                fontSize: 14 * textScaleFactor,
                color: AppColors.lightGrayColor,
              ),
            ),
            SizedBox(height: screenSize.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                hasLiveDarshan
                    ? OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: screenSize.height * 0.007, horizontal: screenSize.width * 0.04),
                          side: BorderSide.none,
                          backgroundColor: AppColors.mapLightGrayColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Live Darshan',
                          style: TextStyle(
                            fontSize: 16 * textScaleFactor,
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
                Row(
                  children: [
                    Text(
                      'Navigate',
                      style: TextStyle(
                        fontSize: 16 * textScaleFactor,
                        color: AppColors.blackColor,
                      ),
                    ),
                    SizedBox(width: screenSize.width * 0.01),
                    const Icon(
                      Icons.chevron_right,
                      color: AppColors.darkGrayColor,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
