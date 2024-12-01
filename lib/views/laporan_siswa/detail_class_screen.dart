import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku/constants/app_colors.dart';
import 'package:talentaku/constants/app_sizes.dart';
import 'package:talentaku/constants/app_text_styles.dart';
import 'package:talentaku/controllers/class_detail_controller.dart';
import 'package:talentaku/widgets/laporan_siswa_card.dart';
import 'package:talentaku/views/laporan_siswa/create_laporan_screen.dart';

class ClassDetailScreen extends StatelessWidget {
  const ClassDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ClassDetailController());

    return Scaffold(
      backgroundColor: AppColors.primary,
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: AppSizes.spaceL),
        child: FloatingActionButton.extended(
          onPressed: () => _showStudentPicker(context),
          backgroundColor: AppColors.secondary,
          elevation: 4,
          icon: Icon(
            Icons.add_circle_outline,
            color: AppColors.textLight,
          ),
          label: Text(
            'Buat Laporan',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textLight,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Container(
              padding: EdgeInsets.all(AppSizes.paddingL),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back Button & Title
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: AppColors.textLight,
                              size: AppSizes.iconL,
                            ),
                            onPressed: () => Get.back(),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.className,
                                style: AppTextStyles.heading1.copyWith(
                                  color: AppColors.textLight,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppSizes.paddingM,
                                  vertical: AppSizes.paddingXS,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.textLight,
                                  borderRadius:
                                      BorderRadius.circular(AppSizes.radiusM),
                                ),
                                child: Text(
                                  controller.classCategory,
                                  style: AppTextStyles.bodySmall.copyWith(
                                    color: AppColors.primaryDark,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  // Students List - Redesigned
                  SizedBox(height: AppSizes.spaceL),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: AppSizes.paddingL),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Teacher Section
                        Row(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.textLight,
                                  width: 2,
                                ),
                                color: AppColors.secondaryLight,
                              ),
                              child: Icon(
                                Icons.school,
                                color: AppColors.primary,
                                size: AppSizes.iconXL,
                              ),
                            ),
                            SizedBox(width: AppSizes.spaceM),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Guru Kelas',
                                  style: AppTextStyles.bodySmall.copyWith(
                                    color: AppColors.textLight.withOpacity(0.8),
                                  ),
                                ),
                                Text(
                                  'Bu Sekar',
                                  style: AppTextStyles.bodyLarge.copyWith(
                                    color: AppColors.textLight,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        // Divider
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: AppSizes.spaceM),
                          child: Divider(
                            color: AppColors.textLight.withOpacity(0.2),
                            thickness: 1,
                          ),
                        ),

                        // Students Section Title
                        Text(
                          'Daftar Siswa',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.textLight.withOpacity(0.8),
                          ),
                        ),
                        SizedBox(height: AppSizes.spaceM),

                        // Students Grid
                        Container(
                          height: 160,
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 2.5,
                              crossAxisSpacing: AppSizes.spaceM,
                              mainAxisSpacing: AppSizes.spaceM,
                            ),
                            itemCount: controller.students.length,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: AppColors.textLight.withOpacity(0.1),
                                  borderRadius:
                                      BorderRadius.circular(AppSizes.radiusM),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 45,
                                      height: 45,
                                      margin: EdgeInsets.all(AppSizes.paddingS),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppColors.textLight,
                                          width: 2,
                                        ),
                                        color: AppColors.secondaryLight,
                                      ),
                                      child: Icon(
                                        Icons.person,
                                        color: AppColors.primary,
                                        size: AppSizes.iconL,
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            right: AppSizes.paddingS),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller.students[index]
                                                  ['name']!,
                                              style: AppTextStyles.bodyMedium
                                                  .copyWith(
                                                color: AppColors.textLight,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              'Siswa',
                                              style: AppTextStyles.bodySmall
                                                  .copyWith(
                                                color: AppColors.textLight
                                                    .withOpacity(0.8),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Content Section
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSizes.radiusXL),
                    topRight: Radius.circular(AppSizes.radiusXL),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // History Header with Filter
                    Padding(
                      padding: EdgeInsets.all(AppSizes.paddingXL),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'History Anda',
                            style: AppTextStyles.heading3.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          Row(
                            children: [
                              // Filter Button
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppSizes.paddingM,
                                  vertical: AppSizes.paddingXS,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primary.withOpacity(0.1),
                                  borderRadius:
                                      BorderRadius.circular(AppSizes.radiusL),
                                ),
                                child: Obx(() => PopupMenuButton<String>(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.filter_list,
                                            color: AppColors.primary,
                                            size: AppSizes.iconM,
                                          ),
                                          SizedBox(width: AppSizes.spaceXS),
                                          Text(
                                            controller.selectedFilter.value,
                                            style: AppTextStyles.bodySmall
                                                .copyWith(
                                              color: AppColors.primary,
                                            ),
                                          ),
                                        ],
                                      ),
                                      itemBuilder: (context) => [
                                        'Semua Laporan',
                                        '7 Hari Terakhir',
                                        'Pilih Tanggal',
                                      ].map((String value) {
                                        return PopupMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onSelected: (value) {
                                        if (value == 'Pilih Tanggal') {
                                          controller.showDatePicker(context);
                                        } else {
                                          controller.filterLaporan(value);
                                        }
                                      },
                                    )),
                              ),
                              SizedBox(width: AppSizes.spaceM),
                              // Add Report Button
                            ],
                          ),
                        ],
                      ),
                    ),

                    // History List
                    Expanded(
                      child: Obx(() => ListView.builder(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppSizes.paddingXL,
                            ),
                            itemCount: controller.filteredHistories.length,
                            itemBuilder: (context, index) {
                              return LaporanSiswaCard(
                                laporan: controller.filteredHistories[index],
                                index: index,
                              );
                            },
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showStudentPicker(BuildContext context) {
    final controller = Get.find<ClassDetailController>();
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(AppSizes.paddingXL),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppSizes.radiusXL),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pilih Siswa',
              style: AppTextStyles.heading3,
            ),
            SizedBox(height: AppSizes.spaceL),
            ...controller.students
                .map(
                  (student) => InkWell(
                    onTap: () {
                      Get.back();
                      Get.to(() => CreateLaporanScreen(student: student));
                    },
                    child: Container(
                      padding: EdgeInsets.all(AppSizes.paddingL),
                      margin: EdgeInsets.only(bottom: AppSizes.paddingM),
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(AppSizes.radiusL),
                        border: Border.all(
                            color: AppColors.primary.withOpacity(0.2)),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: AppSizes.iconL,
                            backgroundColor: AppColors.secondaryLight,
                            child: Icon(
                              Icons.person,
                              color: AppColors.primary,
                              size: AppSizes.iconL,
                            ),
                          ),
                          SizedBox(width: AppSizes.spaceM),
                          Text(
                            student['name']!,
                            style: AppTextStyles.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }
}
