import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
import 'package:tomy_timer/utils/constants.dart';
part 'meeting.g.dart';

@collection
class Meeting {

  Id id;
  DateTime date;
  bool current;
  int selectedItem;
  DateTime? startingTime;

  Meeting({
    required this.id,
    required this.date,
    this.current = true,
    required this.selectedItem,
    this.startingTime,
  });

  factory Meeting.createEmptyMeeting(){
    return Meeting(id: Constants.newRecordId, date: DateTime.now(), selectedItem: 0);
  }

  EMeeting toEMeeting(){
    return EMeeting(id: id, date: date, current: current, selectedItem: selectedItem, startingTime: startingTime);
  }
}

class EMeeting with EquatableMixin{

  final int id;
  final DateTime date;
  final bool current;
  final int selectedItem;
  final DateTime? startingTime;
  EMeeting({
    required this.id,
    required this.date,
    required this.current,
    required this.selectedItem,
    this.startingTime,
  });
  
  @override
  List<Object?> get props => [id, date, current, selectedItem, startingTime];
}
