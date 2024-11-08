import 'package:isar/isar.dart';

import 'package:tomy_timer/models/meeting.dart';
import 'package:tomy_timer/repositories/meetings_repository.dart';

class MeetingsRepositoryIsar extends MeetingsRepository {

  final Isar isar;

  MeetingsRepositoryIsar._({
    required this.isar,
  });

  factory MeetingsRepositoryIsar(Isar isar){
    return MeetingsRepositoryIsar._(isar: isar);
  }
  
  @override
  Future<Meeting?> createMeeting(Meeting meeting, {bool generateId = true}) async {
    await isar.writeTxn(() async{
      await isar.meetings.put(meeting);
    });
    return meeting;
  }

  @override
  Future<void> deleteMeeting(int meetingId) async{
    await isar.writeTxn(() async{
      await isar.meetings.delete(meetingId);
    });
  }

  @override
  Future<Meeting?> getMeeting(int id) async{
    return isar.meetings.get(id);
  }

  @override
  Future<Meeting?> updateMeeting(Meeting meeting) async{
    await isar.writeTxn(() async{
      await isar.meetings.put(meeting);
    });
    return meeting;
  }
  
  @override
  Future<List<Meeting>> getAllMeetings() {
    return isar.meetings.where().findAll();
  }

}
