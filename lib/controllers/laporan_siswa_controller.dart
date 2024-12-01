import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:talentaku/models/laporan_preview_event.dart';
import 'package:talentaku/widgets/date_picker_card.dart';

class LaporanSiswaController extends GetxController {
  final RxList<LaporanPreviewEvent> filteredLaporan =
      <LaporanPreviewEvent>[].obs;
}
