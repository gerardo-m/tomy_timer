import 'package:isar/isar.dart';

import 'package:tomy_timer/models/meeting_item.dart';
import 'package:tomy_timer/repositories/meeting_items_repository.dart';

class MeetingItemsRepositoryIsar extends MeetingItemsRepository {

  final Isar isar;

  MeetingItemsRepositoryIsar._({
    required this.isar,
  });

  factory MeetingItemsRepositoryIsar(Isar isar){
    return MeetingItemsRepositoryIsar._(isar: isar);
  }
  
  @override
  Future<MeetingItem?> createMeetingItem(MeetingItem meetingItem, {bool generateId = true}) async {
    await isar.writeTxn(() async{
      await isar.meetingItems.put(meetingItem);
    });
    return meetingItem;
  }

  @override
  Future<void> deleteMeetingItem(int meetingItemId) async{
    await isar.writeTxn(() async{
      await isar.meetingItems.delete(meetingItemId);
    });
  }

  @override
  Future<MeetingItem?> getMeetingItem(int id) async{
    return isar.meetingItems.get(id);
  }

  @override
  Future<MeetingItem?> updateMeetingItem(MeetingItem meetingItem) async{
    await isar.writeTxn(() async{
      await isar.meetingItems.put(meetingItem);
    });
    return meetingItem;
  }
  
  @override
  Future<List<MeetingItem>> getAllMeetingItems() {
    return isar.meetingItems.where().findAll();
  }
  
  @override
  Future<List<MeetingItem>> getMeetingItems(int meetingId) {
    return isar.meetingItems.filter().meetingIdEqualTo(meetingId).findAll();
  }
  
  @override
  Future<MeetingItem?> getFromMeeting(int meetingId, int orderNumber) {
    return isar.meetingItems.filter().meetingIdEqualTo(meetingId).orderNumberEqualTo(orderNumber).findFirst();
  }

}
