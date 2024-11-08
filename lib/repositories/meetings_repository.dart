import 'package:tomy_timer/models/meeting.dart';
  
abstract class MeetingsRepository{

  Future<Meeting?> getMeeting(int id);
  Future<Meeting?> createMeeting(Meeting meeting, {bool generateId = true});
  Future<Meeting?> updateMeeting(Meeting meeting);
  Future<void> deleteMeeting(int meetingId);
  Future<List<Meeting>> getAllMeetings();
}