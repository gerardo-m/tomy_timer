import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
import 'package:tomy_timer/utils/constants.dart';
part 'meeting.g.dart';

@collection
class Meeting {

  Id id = Isar.autoIncrement;
  DateTime date;
  bool current;
  DateTime? startingTime;

  Meeting({
    required this.id,
    required this.date,
    this.current = true,
    this.startingTime,
  });

  factory Meeting.createEmptyMeeting(){
    return Meeting(id: Constants.newRecordId, date: DateTime.now());
  }

  EMeeting toEMeeting(){
    return EMeeting(id: id, date: date, current: current, startingTime: startingTime);
  }
}

class EMeeting with EquatableMixin{

  final int id;
  final DateTime date;
  final bool current;
  final DateTime? startingTime;
  EMeeting({
    required this.id,
    required this.date,
    required this.current,
    this.startingTime,
  });
  
  @override
  List<Object?> get props => [id, date, current, startingTime];
}
