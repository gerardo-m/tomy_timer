import 'package:flutter/material.dart';
import 'package:tomy_timer/models/report_item.dart';
import 'package:tomy_timer/utils/utils.dart';
import 'package:tomy_timer/views/report/cubit/report_cubit.dart';

class ReportScreen extends StatelessWidget{
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ReportBlocBuilder(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Reporte'),
          ),
          body: ListView(
            children: [
              ListTile(
                title: const Text('Inicio de reunión'),
                subtitle: Text(state.report.actualStartTime.tohhmm()),
              ),
              ListTile(
                title: const Text('Estado de la reunion'),
                subtitle: Text('Retrasado: ${state.report.actualReportTime.tohhmm()} : ${state.report.scheduledReportTime?.tohhmm()}'),
              ),
              ListTile(
                title: const Text('Oradores'),
                subtitle: Column(
                  children: [
                    for (EReportItem speaker in state.speakers)
                      Text('${speaker.role}: ${speaker.actualDuration.tommss()} : ${speaker.maxDuration.tommss()}'),
                  ],
                ),
              ),
              ListTile(
                title: const Text('Retrasos'),
                subtitle: Column(
                  children: [
                    for (EReportItem outOfTime in state.outOfTimeMembers)
                      Text('${outOfTime.role}: ${outOfTime.actualDuration.tommss()} : ${outOfTime.maxDuration.tommss()}'),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
  