import 'package:flutter/material.dart';
import 'package:talentaku/constants/app_colors.dart';
import 'package:talentaku/constants/app_sizes.dart';
import 'package:talentaku/constants/app_text_styles.dart';

class PhotoUploadSection extends StatelessWidget {
  const PhotoUploadSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppSizes.paddingM),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppSizes.radiusM),
        border: Border.all(color: AppColors.primary),
      ),
      child: Column(
        children: [
          Icon(
            Icons.photo_camera,
            size: AppSizes.iconXL,
            color: AppColors.primary,
          ),
          SizedBox(height: AppSizes.spaceXS),
          Text(
            'Foto',
            style: AppTextStyles.bodyMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
} 