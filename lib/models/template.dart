import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
import 'package:tomy_timer/models/template_item.dart';
import 'package:tomy_timer/utils/constants.dart';
part 'template.g.dart';

@collection
class Template {
  Id id;
  DateTime scheduledStartingTime;

  String name;

  @ignore
  List<TemplateItem> items = [];

  Template({
    required this.id,
    required this.scheduledStartingTime,
    required this.name,
  });

  factory Template.createEmptyTemplate(){
    return Template(id: Constants.newRecordId, scheduledStartingTime: DateTime.now(), name: '<Plantilla>');
  }

  ETemplate toETemplate() {
    return ETemplate(
      id: id,
      scheduledStartingTime: scheduledStartingTime,
      name: name,
    );
  }
}

class ETemplate with EquatableMixin {
  final Id id;
  final DateTime scheduledStartingTime;
  final String name;

  ETemplate({
    required this.id,
    required this.scheduledStartingTime,
    required this.name,
  });

  @override
  List<Object?> get props => [id, scheduledStartingTime, name];
}
