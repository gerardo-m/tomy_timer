import 'package:tomy_timer/models/meeting_item.dart';
  
abstract class MeetingItemsRepository{

  Future<MeetingItem?> getMeetingItem(int id);
  Future<MeetingItem?> createMeetingItem(MeetingItem meetingItem, {bool generateId = true});
  Future<MeetingItem?> updateMeetingItem(MeetingItem meetingItem);
  Future<void> deleteMeetingItem(int meetingItemId);
  Future<List<MeetingItem>> getMeetingItems(int meetingId);
  Future<List<MeetingItem>> getAllMeetingItems();
}