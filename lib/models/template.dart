import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
import 'package:tomy_timer/utils/constants.dart';
part 'template.g.dart';

@collection
class Template {
  Id id;
  DateTime date;

  String name;

  Template({
    required this.id,
    required this.date,
    required this.name,
  });

  factory Template.createEmptyTemplate(){
    return Template(id: Constants.newRecordId, date: DateTime.now(), name: '<Plantilla>');
  }

  ETemplate toETemplate() {
    return ETemplate(
      id: id,
      date: date,
      name: name,
    );
  }
}

class ETemplate with EquatableMixin {
  final Id id;
  final DateTime date;
  final String name;

  ETemplate({
    required this.id,
    required this.date,
    required this.name,
  });

  @override
  List<Object?> get props => [id, date, name];
}
