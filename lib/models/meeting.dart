import 'package:equatable/equatable.dart';

class Meeting {

  int id;
  DateTime date;

  Meeting({
    required this.id,
    required this.date,
  });

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
