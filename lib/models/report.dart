import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
import 'package:tomy_timer/models/meeting.dart';
import 'package:tomy_timer/models/report_item.dart';
import 'package:tomy_timer/utils/utils.dart';

part 'report.g.dart';

@collection
class Report {
  Id id;
  DateTime scheduledStartTime;
  DateTime actualStartTime;

  DateTime actualReportTime;
  DateTime? scheduledReportTime;

  int meetingId;

  @ignore
  List<ReportItem> speakers = [];
  @ignore
  List<ReportItem> outOfTimeMembers = [];
  
  Report({
    required this.id,
    required this.scheduledStartTime,
    required this.actualStartTime,
    required this.actualReportTime,
    this.scheduledReportTime,
    required this.meetingId,
  });

  factory Report.fromMeeting(Meeting meeting) {
    return Report(
      id: Constants.newRecordId,
      scheduledStartTime: meeting.date,
      actualStartTime: meeting.startingTime ?? meeting.date,
      actualReportTime: DateTime.now(),
      meetingId: meeting.id,
    );
  }

  EReport toEReport() {
    return EReport(
      id: id,
      scheduledStartTime: scheduledStartTime,
      actualStartTime: actualStartTime,
      actualReportTime: actualReportTime,
      scheduledReportTime: scheduledReportTime,
      meetingId: meetingId,
    );
  }
}

class EReport with EquatableMixin {
  final Id id;
  final DateTime scheduledStartTime;
  final DateTime actualStartTime;

  final DateTime actualReportTime;
  final DateTime? scheduledReportTime;

  final int meetingId;

  EReport({
    required this.id,
    required this.scheduledStartTime,
    required this.actualStartTime,
    required this.actualReportTime,
    required this.scheduledReportTime,
    required this.meetingId,
  });

  @override
  List<Object?> get props =>
      [id, scheduledStartTime, actualReportTime, scheduledReportTime, actualReportTime, meetingId];
}
