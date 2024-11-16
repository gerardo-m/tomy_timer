import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
import 'package:tomy_timer/models/meeting_item.dart';

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
  int meetingItemId;

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
    required this.meetingItemId,
  });

  factory ReportItem.fromMeetingItem(int reportId, MeetingItem meetingItem) {
    return ReportItem(
      id: Isar.autoIncrement,
      role: meetingItem.role,
      name: meetingItem.name,
      iMinTime: meetingItem.greenTime ?? 0,
      iMaxTime: meetingItem.redTime,
      iActualTime: meetingItem.duration.inMilliseconds,
      orderNumber: meetingItem.orderNumber,
      roleType: meetingItem.roleType,
      reportId: reportId,
      meetingItemId: meetingItem.id,
    );
  }

  @ignore
  Duration get minDuration => Duration(milliseconds: iMinTime);
  @ignore
  Duration get maxDuration => Duration(milliseconds: iMaxTime);
  @ignore
  Duration get actualDuration => Duration(milliseconds: iActualTime);

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
      meetingItemId: meetingItemId,
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
  final int meetingItemId;

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
    required this.meetingItemId,
  });

  Duration get minDuration => Duration(milliseconds: iMinTime);
  Duration get maxDuration => Duration(milliseconds: iMaxTime);
  Duration get actualDuration => Duration(milliseconds: iActualTime);

  @override
  List<Object?> get props => [id, role, name, iMinTime, iMaxTime, iActualTime, orderNumber, roleType, reportId, meetingItemId];
}
