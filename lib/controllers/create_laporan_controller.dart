import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:talentaku/models/laporan_form_model.dart';

class CreateLaporanController extends GetxController {
  final Map<String, String> student;
  final formKey = GlobalKey<FormState>();
  
  CreateLaporanController({required this.student});

  final selectedDate = DateTime.now().obs;
  final selectedSemester = 'Semester 1'.obs;
  final List<String> semesters = ['Semester 1', 'Semester 2'];

  // Sections dengan form fields kosong
  final sections = [
    LaporanSection(
      title: 'Kegiatan Awal',
      forms: [LaporanFormModel()],
    ),
    LaporanSection(
      title: 'Kegiatan Inti',
      forms: [LaporanFormModel()],
    ),
    LaporanSection(
      title: 'Snack',
      forms: [LaporanFormModel()],
    ),
    LaporanSection(
      title: 'Inklusi',
      forms: [LaporanFormModel()],
    ),
  ].obs;

  final catatan = ''.obs;
  final selectedPhotos = <String>[].obs;

  String get formattedDate => DateFormat('dd/MM/yyyy').format(selectedDate.value);

  void updateDate(DateTime date) {
    selectedDate.value = date;
  }

  void updateSemester(String? semester) {
    if (semester != null) {
      selectedSemester.value = semester;
    }
  }

  void updateHasil(int sectionIndex, int formIndex, String value) {
    final form = sections[sectionIndex].forms[formIndex];
    form.hasil = value;
    sections.refresh();
  }

  void addPhoto(String path) {
    selectedPhotos.add(path);
  }

  void removePhoto(int index) {
    selectedPhotos.removeAt(index);
  }

  void submitLaporan() {
    if (formKey.currentState!.validate()) {
      // TODO: Implement laporan submission
      Get.back();
      Get.snackbar(
        'Sukses',
        'Laporan berhasil dibuat',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  // Tambahkan method untuk update kegiatan
  void updateKegiatan(int sectionIndex, int formIndex, String value) {
    sections[sectionIndex].forms[formIndex].kegiatan = value;
    sections.refresh();
  }
} 