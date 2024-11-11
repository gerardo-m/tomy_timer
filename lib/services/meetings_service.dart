import 'dart:async';

import 'package:tomy_timer/models/meeting.dart';
import 'package:tomy_timer/repositories/meetings_repository.dart';
import 'package:tomy_timer/utils/constants.dart';

class MeetingsService {
  MeetingsRepository meetingsRepository;

  MeetingsService._({
    required this.meetingsRepository,
  });

  factory MeetingsService(MeetingsRepository meetingsRepository) {
    return MeetingsService._(meetingsRepository: meetingsRepository);
  }

  Future<List<Meeting>> loadMeetings() async {
    return meetingsRepository.getAllMeetings();
  }

  Future<Meeting?> getMeeting(int id) async {
    return meetingsRepository.getMeeting(id);
  }

  Future<Meeting?> saveMeeting(Meeting meeting) async {
    if (meeting.id == Constants.newRecordId){
      return meetingsRepository.createMeeting(meeting);
    }else{
      return meetingsRepository.updateMeeting(meeting);
    }
  }

  Future<void> deleteMeeting(int id) async {
    return meetingsRepository.deleteMeeting(id);
  }

  Future<Meeting?> getCurrentMeeting() async{
    return meetingsRepository.getCurrentMeeting();
  }
}
