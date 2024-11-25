import 'dart:async';
import 'dart:convert';

import 'package:tomy_timer/models/meeting.dart';
import 'package:tomy_timer/models/meeting_item.dart';
import 'package:tomy_timer/models/template.dart';
import 'package:tomy_timer/models/template_item.dart';
import 'package:tomy_timer/repositories/meeting_items_repository.dart';
import 'package:tomy_timer/repositories/meetings_repository.dart';
import 'package:tomy_timer/repositories/template_items_repository.dart';
import 'package:tomy_timer/repositories/templates_repository.dart';
import 'package:tomy_timer/utils/constants.dart';
import 'package:tomy_timer/utils/enums.dart';

class MeetingsService {
  MeetingsRepository meetingsRepository;
  TemplatesRepository templatesRepository;
  MeetingItemsRepository meetingItemsRepository;
  TemplateItemsRepository templateItemsRepository;

  MeetingsService._({
    required this.meetingsRepository,
    required this.templatesRepository,
    required this.meetingItemsRepository,
    required this.templateItemsRepository,
  });

  factory MeetingsService(
    MeetingsRepository meetingsRepository,
    TemplatesRepository templatesRepository,
    MeetingItemsRepository meetingItemsRepository,
    TemplateItemsRepository templateItemsRepository,
  ) {
    return MeetingsService._(
      meetingsRepository: meetingsRepository,
      templatesRepository: templatesRepository,
      meetingItemsRepository: meetingItemsRepository,
      templateItemsRepository: templateItemsRepository,
    );
  }

  Future<List<Meeting>> loadMeetings() async {
    return meetingsRepository.getAllMeetings();
  }

  Future<Meeting?> getMeeting(int id) async {
    return meetingsRepository.getMeeting(id);
  }

  Future<Meeting?> saveMeeting(Meeting meeting) async {
    if (meeting.id == Constants.newRecordId) {
      return meetingsRepository.createMeeting(meeting);
    } else {
      return meetingsRepository.updateMeeting(meeting);
    }
  }

  Future<void> deleteMeeting(int id) async {
    return meetingsRepository.deleteMeeting(id);
  }

  Future<Meeting?> getCurrentMeeting() async {
    return meetingsRepository.getCurrentMeeting();
  }

  /// Generates and SAVES a meeting from a template
  Future<Meeting?> generateFromTemplate(int templateId) async {
    Template? template = await templatesRepository.getTemplate(templateId);
    if (template == null) return null;
    Meeting meeting = Meeting.fromTemplate(template);
    Meeting? savedMeeting = await meetingsRepository.createMeeting(meeting);
    if (savedMeeting == null) return null;
    List<TemplateItem> templateItems = await templateItemsRepository.getTemplateItems(templateId);
    for (TemplateItem templateItem in templateItems) {
      MeetingItem meetingItem = MeetingItem.createFromTemplateItem(savedMeeting.id, templateItem);
      await meetingItemsRepository.createMeetingItem(meetingItem);
    }
    return savedMeeting;
  }

  /// Generates and SAVES a meeting from json data from Tomy
  Future<Meeting?> generateFromTomy(String data) async {
    Map<String, dynamic> objectData = json.decode(data);
    Meeting meeting = Meeting(
      id: Constants.newRecordId,
      date: DateTime.fromMillisecondsSinceEpoch(objectData['date']),
      selectedItem: 0,
    );
    Meeting? savedMeeting = await meetingsRepository.createMeeting(meeting);
    if (savedMeeting == null) return null;
    List items = objectData['items'];
    for (Map<String, dynamic> item in items) {
      MeetingItem meetingItem = MeetingItem(
        id: Constants.newRecordId,
        name: item['memberName'],
        role: item['participantName'],
        iduration: 0,
        startTime: DateTime.now(),
        scheduledStartTime: DateTime.fromMillisecondsSinceEpoch(item['startTime']),
        orderNumber: item['orderNumber'] - 1, // In tomy orderNumber is base 1
        roleType: item['roleNumber'] == 'Orador' ? RoleType.speaker : RoleType.nonSpeaker,
        greenTime: item['time1'],
        ambarTime: item['time2'],
        redTime: item['time3'],
        meetingId: meeting.id,
      );
      await meetingItemsRepository.createMeetingItem(meetingItem);
    }
    return meeting;
  }
}
