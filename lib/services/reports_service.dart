import 'dart:async';

import 'package:tomy_timer/models/meeting.dart';
import 'package:tomy_timer/models/meeting_item.dart';
import 'package:tomy_timer/models/report.dart';
import 'package:tomy_timer/models/report_item.dart';
import 'package:tomy_timer/repositories/meeting_items_repository.dart';
import 'package:tomy_timer/repositories/meetings_repository.dart';
import 'package:tomy_timer/repositories/report_items_repository.dart';
import 'package:tomy_timer/repositories/reports_repository.dart';
import 'package:tomy_timer/utils/utils.dart';

class ReportsService {
  ReportsRepository reportsRepository;
  ReportItemsRepository reportItemsRepository;
  MeetingsRepository meetingsRepository;
  MeetingItemsRepository meetingItemsRepository;

  ReportsService._({
    required this.reportsRepository,
    required this.reportItemsRepository,
    required this.meetingsRepository,
    required this.meetingItemsRepository,
  });

  factory ReportsService(
    ReportsRepository reportsRepository,
    ReportItemsRepository reportItemsRepository,
    MeetingsRepository meetingsRepository,
    MeetingItemsRepository meetingItemsRepository,
  ) {
    return ReportsService._(
      reportsRepository: reportsRepository,
      reportItemsRepository: reportItemsRepository,
      meetingsRepository: meetingsRepository,
      meetingItemsRepository: meetingItemsRepository,
    );
  }

  Future<List<Report>> loadReports() async {
    return reportsRepository.getAllReports();
  }

  Future<Report?> getReport(int id) async {
    return reportsRepository.getReport(id);
  }

  Future<Report?> saveReport(Report report) async {
    if (report.id == Constants.newRecordId) {
      return reportsRepository.createReport(report);
    } else {
      return reportsRepository.updateReport(report);
    }
  }

  Future<void> deleteReport(int id) {
    return reportsRepository.deleteReport(id);
  }

  Future<Report?> generateFromMeeting(meetingId) async {
    Meeting? meeting = await meetingsRepository.getMeeting(meetingId);
    if (meeting == null)return null;
    List<MeetingItem> meetingItems = await meetingItemsRepository.getMeetingItems(meetingId);
    Report report = Report.fromMeeting(meeting);
    for (MeetingItem meetingItem in meetingItems){
      if (meetingItem.roleType != RoleType.speaker){
        if (meetingItem.redTime > meetingItem.iduration && (meetingItem.greenTime ?? 0) < meetingItem.iduration) continue;
      }
      ReportItem reportItem = ReportItem.fromMeetingItem(report.id, meetingItem);
      if (meetingItem.orderNumber == meeting.selectedItem){
        if (meetingItem.scheduledStartTime != null) report.scheduledReportTime = meetingItem.scheduledStartTime;
      }
      if (reportItem.roleType == RoleType.speaker) {
        report.speakers.add(reportItem);
      } else {
        report.outOfTimeMembers.add(reportItem);
      }
    }
    return report;
  }
}
