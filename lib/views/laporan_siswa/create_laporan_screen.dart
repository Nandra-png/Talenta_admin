import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku/constants/app_colors.dart';
import 'package:talentaku/constants/app_sizes.dart';
import 'package:talentaku/constants/app_text_styles.dart';
import 'package:talentaku/controllers/create_laporan_controller.dart';
import 'package:talentaku/widgets/date_picker_card.dart';
import 'package:talentaku/models/laporan_form_model.dart';

class CreateLaporanScreen extends StatelessWidget {
  final Map<String, String> student;

  const CreateLaporanScreen({
    Key? key,
    required this.student,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreateLaporanController(student: student));

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.textPrimary,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Buat Laporan Harian',
          style: AppTextStyles.heading3,
        ),
      ),
      body: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AppSizes.paddingXL),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date and Semester Row
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        final DateTime? picked = await DatePickerCard.show(
                          initialDate: controller.selectedDate.value,
                          firstDate: DateTime(2024),
                          lastDate: DateTime.now(),
                          onDateSelected: controller.updateDate,
                        );
                        if (picked != null) {
                          controller.updateDate(picked);
                        }
                      },
                      child: Container(
                        height: 40,
                        padding: EdgeInsets.all(AppSizes.paddingM),
                        decoration: BoxDecoration(
                          color: AppColors.cardBackground,
                          borderRadius: BorderRadius.circular(AppSizes.radiusM),
                          border: Border.all(color: AppColors.primary),
                        ),
                        child: Obx(() => Text(
                              controller.formattedDate,
                              style: AppTextStyles.bodyMedium,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(width: AppSizes.spaceM),
                  Expanded(
                    child: Container(
                      height: 40,
                      padding:
                          EdgeInsets.symmetric(horizontal: AppSizes.paddingM),
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        borderRadius: BorderRadius.circular(AppSizes.radiusM),
                        border: Border.all(color: AppColors.primary),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: Obx(() => DropdownButton<String>(
                              value: controller.selectedSemester.value,
                              items: controller.semesters.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: controller.updateSemester,
                              style: AppTextStyles.bodyMedium,
                            )),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: AppSizes.spaceL),

              // Sections
              Obx(() => Column(
                    children: List.generate(controller.sections.length,
                        (sectionIndex) {
                      final section = controller.sections[sectionIndex];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            section.title,
                            style: AppTextStyles.heading3,
                          ),
                          SizedBox(height: AppSizes.spaceM),
                          ...List.generate(section.forms.length, (formIndex) {
                            final form = section.forms[formIndex];
                            return Container(
                              margin: EdgeInsets.only(bottom: AppSizes.spaceM),
                              padding: EdgeInsets.all(AppSizes.paddingM),
                              decoration: BoxDecoration(
                                color: AppColors.cardBackground,
                                borderRadius:
                                    BorderRadius.circular(AppSizes.radiusM),
                                border: Border.all(color: AppColors.primary),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    initialValue: form.kegiatan,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Masukkan kegiatan...',
                                      hintStyle:
                                          AppTextStyles.bodyMedium.copyWith(
                                        color: AppColors.textPrimary
                                            .withOpacity(0.5),
                                      ),
                                    ),
                                    style: AppTextStyles.bodyMedium,
                                    maxLines: null,
                                    onChanged: (value) =>
                                        controller.updateKegiatan(
                                      sectionIndex,
                                      formIndex,
                                      value,
                                    ),
                                  ),
                                  Divider(
                                      color:
                                          AppColors.primary.withOpacity(0.2)),
                                  Row(
                                    children: [
                                      Text(
                                        'Hasil:',
                                        style: AppTextStyles.bodyMedium,
                                      ),
                                      SizedBox(width: AppSizes.spaceS),
                                      Expanded(
                                        child: Row(
                                          children: LaporanSection.hasilOptions
                                              .map((option) {
                                            final isSelected =
                                                form.hasil == option;
                                            return Expanded(
                                              child: GestureDetector(
                                                onTap: () =>
                                                    controller.updateHasil(
                                                  sectionIndex,
                                                  formIndex,
                                                  option,
                                                ),
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      right:
                                                          AppSizes.paddingXS),
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: AppSizes.paddingS,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: isSelected
                                                        ? AppColors.primary
                                                        : AppColors
                                                            .cardBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            AppSizes.radiusM),
                                                    border: Border.all(
                                                      color: isSelected
                                                          ? AppColors.primary
                                                          : AppColors.primary
                                                              .withOpacity(0.3),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    option,
                                                    textAlign: TextAlign.center,
                                                    style: AppTextStyles
                                                        .bodySmall
                                                        .copyWith(
                                                      color: isSelected
                                                          ? AppColors.textLight
                                                          : AppColors
                                                              .textPrimary,
                                                      fontWeight: isSelected
                                                          ? FontWeight.w600
                                                          : FontWeight.normal,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }),
                          SizedBox(height: AppSizes.spaceL),
                        ],
                      );
                    }),
                  )),

              // Catatan
              Text(
                'Catatan',
                style: AppTextStyles.heading3,
              ),
              SizedBox(height: AppSizes.spaceM),
              Container(
                padding: EdgeInsets.all(AppSizes.paddingM),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(AppSizes.radiusM),
                  border: Border.all(color: AppColors.primary),
                ),
                child: TextFormField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Tambahkan catatan...',
                  ),
                  onChanged: (value) => controller.catatan.value = value,
                ),
              ),

              SizedBox(height: AppSizes.spaceL),

              // Photo Upload
              Container(
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
              ),

              SizedBox(height: AppSizes.spaceXL),

              // Submit Button
              Container(
                width: double.infinity,
                height: AppSizes.buttonHeight,
                child: ElevatedButton(
                  onPressed: controller.submitLaporan,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSizes.radiusM),
                    ),
                  ),
                  child: Text(
                    'Kirim Laporan',
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
      ),
    );
  }
}
