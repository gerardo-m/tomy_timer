import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';

 part 'report.g.dart';

@collection
class Report {
  Id id;
  DateTime scheduledStartTime;
  DateTime actualStartTime;

  DateTime actualReportTime;
  DateTime scheduledReportTime;

  int meetingId;
  Report({
    required this.id,
    required this.scheduledStartTime,
    required this.actualStartTime,
    required this.actualReportTime,
    required this.scheduledReportTime,
    required this.meetingId,
  });

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
  final DateTime scheduledReportTime;

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
