import 'package:tomy_timer/models/report.dart';
  
abstract class ReportsRepository{

  Future<Report?> getReport(int id);
  Future<Report?> createReport(Report report, {bool generateId = true});
  Future<Report?> updateReport(Report report);
  Future<void> deleteReport(int reportId);
  Future<List<Report>> getAllReports();
}