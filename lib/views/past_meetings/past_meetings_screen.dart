import 'package:flutter/material.dart';
import 'package:tomy_timer/models/report.dart';
import 'package:tomy_timer/utils/datetime_extension.dart';
import 'package:tomy_timer/utils/routes.dart';
import 'package:tomy_timer/views/past_meetings/cubit/past_meetings_cubit.dart';

class PastMeetingsScreen extends StatelessWidget{
  const PastMeetingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PastMeetingsBlocBuilder(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Reuniones pasadas'),
          ),
          body: ListView(
            children:  [
              for (EReport report in state.pastMeetings)
                ListTile(
                  title: Text('Reunión de ${report.scheduledStartTime.toYYYYMMDD()}'),
                  onTap: () {
                    Navigator.pushNamed(context, TomyTimerRoutes.report, arguments: {"id": report.id, "meeting_id": report.meetingId});
                  },
                ),
            ],
          ),
        );
      }
    );
  }
}
  