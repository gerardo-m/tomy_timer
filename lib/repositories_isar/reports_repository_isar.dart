import 'package:isar/isar.dart';

import 'package:tomy_timer/models/report.dart';
import 'package:tomy_timer/repositories/reports_repository.dart';

class ReportsRepositoryIsar extends ReportsRepository {

  final Isar isar;

  ReportsRepositoryIsar._({
    required this.isar,
  });

  factory ReportsRepositoryIsar(Isar isar){
    return ReportsRepositoryIsar._(isar: isar);
  }
  
  @override
  Future<Report?> createReport(Report report, {bool generateId = true}) async {
    await isar.writeTxn(() async{
      await isar.reports.put(report);
    });
    return report;
  }

  @override
  Future<void> deleteReport(int reportId) async{
    await isar.writeTxn(() async{
      await isar.reports.delete(reportId);
    });
  }

  @override
  Future<Report?> getReport(int id) async{
    return isar.reports.get(id);
  }

  @override
  Future<Report?> updateReport(Report report) async{
    await isar.writeTxn(() async{
      await isar.reports.put(report);
    });
    return report;
  }
  
  @override
  Future<List<Report>> getAllReports() {
    return isar.reports.where().findAll();
  }

}
