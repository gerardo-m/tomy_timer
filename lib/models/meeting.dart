import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
import 'package:tomy_timer/utils/constants.dart';
 part 'meeting.g.dart';

@collection
class Meeting {

  Id id = Isar.autoIncrement;
  DateTime date;
  bool current;

  Meeting({
    required this.id,
    required this.date,
    this.current = true,
  });

  factory Meeting.createEmptyMeeting(){
    return Meeting(id: Constants.newRecordId, date: DateTime.now());
  }

  EMeeting toEMeeting(){
    return EMeeting(id: id, date: date);
  }
}

class EMeeting with EquatableMixin{

  final int id;
  final DateTime date;
  EMeeting({
    required this.id,
    required this.date,
  });
  
  @override
  List<Object?> get props => [id, date];
}
