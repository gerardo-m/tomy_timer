import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';

import 'package:tomy_timer/utils/enums.dart';

part 'report_item.g.dart';

@collection
class ReportItem {
  Id id;
  String role;
  String name;
  int iMinTime;
  int iMaxTime;
  int iActualTime;
  int orderNumber;
  @enumerated
  RoleType roleType;

  int reportId;

  ReportItem({
    required this.id,
    required this.role,
    required this.name,
    required this.iMinTime,
    required this.iMaxTime,
    required this.iActualTime,
    required this.orderNumber,
    required this.roleType,
    required this.reportId,
  });

  EReportItem toEReportItem() {
    return EReportItem(
      id: id,
      role: role,
      name: name,
      iMinTime: iMinTime,
      iMaxTime: iMaxTime,
      iActualTime: iActualTime,
      orderNumber: orderNumber,
      roleType: roleType,
      reportId: reportId,
    );
  }
}

class EReportItem with EquatableMixin {
  final Id id;
  final String role;
  final String name;
  final int iMinTime;
  final int iMaxTime;
  final int iActualTime;
  final int orderNumber;
  final RoleType roleType;

  final int reportId;

  EReportItem({
    required this.id,
    required this.role,
    required this.name,
    required this.iMinTime,
    required this.iMaxTime,
    required this.iActualTime,
    required this.orderNumber,
    required this.roleType,
    required this.reportId,
  });

  @override
  List<Object?> get props => [id, role, name, iMinTime, iMaxTime, iActualTime, orderNumber, roleType, reportId];
}
