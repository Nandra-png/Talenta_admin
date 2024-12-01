import 'package:get/get.dart';
import 'package:talentaku/models/laporan_preview_event.dart';

class LaporanSiswaController extends GetxController {
  final RxList<LaporanPreviewEvent> filteredLaporan =
      <LaporanPreviewEvent>[].obs;
}
