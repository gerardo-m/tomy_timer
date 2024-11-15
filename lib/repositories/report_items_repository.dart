import 'package:tomy_timer/models/report_item.dart';
  
abstract class ReportItemsRepository{

  Future<ReportItem?> getReportItem(int id);
  Future<ReportItem?> createReportItem(ReportItem reportItem, {bool generateId = true});
  Future<ReportItem?> updateReportItem(ReportItem reportItem);
  Future<void> deleteReportItem(int reportItemId);
  Future<List<ReportItem>> getAllReportItems();
}