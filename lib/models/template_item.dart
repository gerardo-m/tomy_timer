import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
import 'package:tomy_timer/utils/constants.dart';
import 'package:tomy_timer/utils/enums.dart';
part 'template_item.g.dart';

@collection
class TemplateItem {
  Id id;
  String role;
  String name;

  DateTime scheduledStartTime;
  int orderNumber;

  @enumerated
  RoleType roleType;

  int? greenTime;
  int? ambarTime;
  int redTime;

  @Index()
  int templateId;

  TemplateItem({
    required this.id,
    required this.role,
    required this.name,
    required this.scheduledStartTime,
    required this.orderNumber,
    required this.roleType,
    this.greenTime,
    this.ambarTime,
    required this.redTime,
    required this.templateId,
  });

  factory TemplateItem.createEmptyTemplateItem(int templateId, int orderNumber) {
    return TemplateItem(
      id: Constants.newRecordId,
      role: '',
      name: '',
      scheduledStartTime: DateTime.now(),
      orderNumber: orderNumber,
      roleType: RoleType.nonSpeaker,
      redTime: 60000,
      templateId: templateId,
    );
  }

  @ignore
  Duration? get greenDuration => greenTime != null ? Duration(milliseconds: greenTime!) : null;
  @ignore
  Duration? get ambarDuration => ambarTime != null ? Duration(milliseconds: ambarTime!) : null;
  @ignore
  Duration get redDuration => Duration(milliseconds: redTime);

  ETemplateItem toETemplateItem() {
    return ETemplateItem(
      id: id,
      role: role,
      name: name,
      scheduledStartTime: scheduledStartTime,
      orderNumber: orderNumber,
      roleType: roleType,
      greenTime: greenTime,
      ambarTime: ambarTime,
      redTime: redTime,
      templateId: templateId,
    );
  }
}

class ETemplateItem with EquatableMixin {
  final Id id;
  final String role;
  final String name;

  final DateTime scheduledStartTime;
  final int orderNumber;

  final RoleType roleType;

  final int? greenTime;
  final int? ambarTime;
  final int redTime;

  final int templateId;

  ETemplateItem({
    required this.id,
    required this.role,
    required this.name,
    required this.scheduledStartTime,
    required this.orderNumber,
    required this.roleType,
    required this.greenTime,
    required this.ambarTime,
    required this.redTime,
    required this.templateId,
  });

  Duration? get greenDuration => greenTime != null ? Duration(milliseconds: greenTime!) : null;
  Duration? get ambarDuration => ambarTime != null ? Duration(milliseconds: ambarTime!) : null;
  Duration get redDuration => Duration(milliseconds: redTime);

  @override
  List<Object?> get props => [id, role, name, scheduledStartTime, orderNumber, roleType, greenTime, ambarTime, redTime];
}
