import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku/constants/app_colors.dart';
import 'package:talentaku/constants/app_text_styles.dart';
import 'package:talentaku/constants/app_sizes.dart';

class InfoPopup extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;
  final Color? iconColor;

  const InfoPopup({
    Key? key,
    required this.title,
    required this.message,
    this.icon = Icons.info_outline,
    this.iconColor,
  }) : super(key: key);

  static void show({
    String title = 'Informasi',
    required String message,
    IconData icon = Icons.info_outline,
    Color? iconColor,
  }) {
    Get.dialog(
      InfoPopup(
        title: title,
        message: message,
        icon: icon,
        iconColor: iconColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusL),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppSizes.paddingXL),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: AppSizes.iconL * 2,
              color: iconColor ?? AppColors.primary,
            ),
            SizedBox(height: AppSizes.spaceM),
            Text(
              title,
              style: AppTextStyles.heading3,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppSizes.spaceS),
            Text(
              message,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textPrimary.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppSizes.spaceL),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: EdgeInsets.symmetric(vertical: AppSizes.paddingL),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSizes.radiusM),
                  ),
                ),
                child: Text(
                  'Mengerti',
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.textLight,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 