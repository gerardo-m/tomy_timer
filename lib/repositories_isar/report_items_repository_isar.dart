import 'package:isar/isar.dart';

import 'package:tomy_timer/models/report_item.dart';
import 'package:tomy_timer/repositories/report_items_repository.dart';
import 'package:tomy_timer/utils/enums.dart';

class ReportItemsRepositoryIsar extends ReportItemsRepository {

  final Isar isar;

  ReportItemsRepositoryIsar._({
    required this.isar,
  });

  factory ReportItemsRepositoryIsar(Isar isar){
    return ReportItemsRepositoryIsar._(isar: isar);
  }
  
  @override
  Future<ReportItem?> createReportItem(ReportItem reportItem, {bool generateId = true}) async {
    await isar.writeTxn(() async{
      await isar.reportItems.put(reportItem);
    });
    return reportItem;
  }

  @override
  Future<void> deleteReportItem(int reportItemId) async{
    await isar.writeTxn(() async{
      await isar.reportItems.delete(reportItemId);
    });
  }

  @override
  Future<ReportItem?> getReportItem(int id) async{
    return isar.reportItems.get(id);
  }

  @override
  Future<ReportItem?> updateReportItem(ReportItem reportItem) async{
    await isar.writeTxn(() async{
      await isar.reportItems.put(reportItem);
    });
    return reportItem;
  }
  
  @override
  Future<List<ReportItem>> getAllReportItems() {
    return isar.reportItems.where().findAll();
  }
  
  @override
  Future<List<ReportItem>> getNonSpeakers(int reportId) {
    return isar.reportItems.filter().reportIdEqualTo(reportId).and().roleTypeEqualTo(RoleType.nonSpeaker).findAll();
  }
  
  @override
  Future<List<ReportItem>> getSpeakers(int reportId) {
    return isar.reportItems.filter().reportIdEqualTo(reportId).and().roleTypeEqualTo(RoleType.speaker).findAll();
  }

}
