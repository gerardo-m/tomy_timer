import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
import 'package:tomy_timer/models/template_item.dart';
import 'package:tomy_timer/utils/utils.dart';
part 'meeting_item.g.dart';

@collection
class MeetingItem {
  Id id;
  String name;
  String role;
  int iduration;
  DateTime startTime;
  DateTime? scheduledStartTime;
  int orderNumber;

  @enumerated
  RoleType roleType;

  int? greenTime;
  int? ambarTime;
  int redTime;

  @Index()
  int meetingId;

  MeetingItem({
    required this.id,
    required this.name,
    required this.role,
    required this.iduration,
    required this.startTime,
    this.scheduledStartTime,
    required this.orderNumber,
    required this.roleType,
    this.greenTime,
    this.ambarTime,
    required this.redTime,
    required this.meetingId,
  });

  factory MeetingItem.createEmptyMeetingItem(int meetingId, int orderNumber) {
    return MeetingItem(
      id: Constants.newRecordId,
      name: 'Nombre',
      role: 'Rol',
      iduration: 0,
      startTime: DateTime.now(),
      orderNumber: orderNumber,
      roleType: RoleType.nonSpeaker,
      redTime: const Duration(minutes: 1).inMilliseconds,
      meetingId: meetingId,
    );
  }

  factory MeetingItem.createFromTemplateItem(int meetingId, TemplateItem templateItem) {
    return MeetingItem(
      id: Constants.newRecordId,
      name: templateItem.name,
      role: templateItem.role,
      iduration: 0,
      startTime: templateItem.scheduledStartTime,
      orderNumber: templateItem.orderNumber,
      roleType: templateItem.roleType,
      greenTime: templateItem.greenTime,
      ambarTime: templateItem.ambarTime,
      redTime: templateItem.redTime,
      scheduledStartTime: templateItem.scheduledStartTime,
      meetingId: meetingId,
    );
  }

  @ignore
  Duration? get greenDuration => greenTime != null ? Duration(milliseconds: greenTime!) : null;
  @ignore
  Duration? get ambarDuration => ambarTime != null ? Duration(milliseconds: ambarTime!) : null;
  @ignore
  Duration get redDuration => Duration(milliseconds: redTime);
  @ignore
  Duration get duration => Duration(milliseconds: iduration);

  EMeetingItem toEMeetingItem() {
    return EMeetingItem(
      id: id,
      name: name,
      role: role,
      iduration: iduration,
      startTime: startTime,
      scheduledStartTime: scheduledStartTime,
      orderNumber: orderNumber,
      roleType: roleType,
      greenTime: greenTime,
      ambarTime: ambarTime,
      redTime: redTime,
    );
  }

  Duration getNextMilestone(Duration currentDuration) {
    int iCurrent = currentDuration.inMilliseconds;
    if (greenTime != null) {
      if (iCurrent < greenTime!) return greenDuration!;
    }
    if (ambarTime != null) {
      if (iCurrent < ambarTime!) return ambarDuration!;
    }
    if (iCurrent < redTime) return redDuration;
    return Duration.zero;
  }
}

class EMeetingItem with EquatableMixin {
  final int id;
  final String name;
  final String role;
  final int iduration;
  final DateTime startTime;
  final DateTime? scheduledStartTime;
  final int orderNumber;
  final RoleType roleType;

  final int? greenTime;
  final int? ambarTime;
  final int redTime;

  EMeetingItem({
    required this.id,
    required this.name,
    required this.role,
    required this.iduration,
    required this.startTime,
    required this.scheduledStartTime,
    required this.orderNumber,
    required this.roleType,
    this.greenTime,
    this.ambarTime,
    required this.redTime,
  });

  Duration? get greenDuration => greenTime != null ? Duration(milliseconds: greenTime!) : null;
  Duration? get ambarDuration => ambarTime != null ? Duration(milliseconds: ambarTime!) : null;
  Duration get redDuration => Duration(milliseconds: redTime);
  Duration get duration => Duration(milliseconds: iduration);

  @override
  List<Object?> get props =>
      [id, name, role, iduration, startTime, scheduledStartTime, orderNumber, roleType, greenTime, ambarTime, redTime];
}
