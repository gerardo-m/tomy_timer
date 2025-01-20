import 'package:flutter/material.dart';
import 'package:tomy_timer/models/report_item.dart';
import 'package:tomy_timer/utils/utils.dart';
import 'package:tomy_timer/views/report/cubit/report_cubit.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  final _titleTextStyle = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final _memberTitleStyle = const TextStyle(fontSize: 14, fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    return ReportBlocBuilder(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Reporte'),
        ),
        body: ListView(
          children: [
            ListTile(
              title: Text(
                'Inicio de reunión',
                style: _titleTextStyle,
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                child: Table(
                  children: [
                    TableRow(children: [
                      const Text('Hora programada'),
                      Text(state.report.scheduledStartTime.tohhmm()),
                    ]),
                    TableRow(children: [
                      const Text('Hora real'),
                      Text(state.report.actualStartTime.tohhmm()),
                    ]),
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Estado actual de la reunión',
                style: _titleTextStyle,
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                child: Table(
                  children: [
                    TableRow(children: [
                      const Text('Hora programada'),
                      Text(state.report.scheduledReportTime?.tohhmm() ?? 'Sin asignar'),
                    ]),
                    TableRow(children: [
                      const Text('Hora real'),
                      Text(state.report.actualReportTime.tohhmm()),
                    ]),
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text('Oradores', style: _titleTextStyle),
              subtitle: Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                child: Column(
                  children: [
                    for (EReportItem speaker in state.speakers)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Table(
                          // columnWidths: const <int, TableColumnWidth>{
                          //   1: FixedColumnWidth(64),
                          // },
                          children: [
                            TableRow(
                              children: [
                                Text(
                                  speaker.role,
                                  style: _memberTitleStyle,
                                ),
                                Text(
                                  speaker.name,
                                  style: _memberTitleStyle,
                                ),
                              ],
                            ),
                            TableRow(children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text('Tiempo programado'),
                              ),
                              Text('${speaker.minDuration.tommss()} - ${speaker.maxDuration.tommss()}'),
                            ]),
                            TableRow(children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text('Tiempo real'),
                              ),
                              Wrap(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Text(speaker.actualDuration.tommss()),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                          height: 12,
                                          width: 12,
                                          child: ColoredBox(color: getMarkColor(speaker)),
                                        ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Text(getSpeakerTimeMessage(speaker), overflow: TextOverflow.fade,),
                                      ),
                                    ],
                                  )
                                  
                                ],
                              ),
                            ]),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text('Retrasos', style: _titleTextStyle),
              subtitle: Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                child: Column(
                  children: [
                    for (EReportItem outOfTime in state.outOfTimeMembers)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Table(
                          // columnWidths: const <int, TableColumnWidth>{
                          //   1: FixedColumnWidth(64),
                          // },
                          children: [
                            TableRow(
                              children: [
                                Text(
                                  outOfTime.role,
                                  style: _memberTitleStyle,
                                ),
                                Text(
                                  outOfTime.name,
                                  style: _memberTitleStyle,
                                ),
                              ],
                            ),
                            TableRow(children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text('Tiempo programado'),
                              ),
                              Text('${outOfTime.minDuration.tommss()} - ${outOfTime.maxDuration.tommss()}'),
                            ]),
                            TableRow(children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text('Tiempo real'),
                              ),
                              Row(
                                children: [
                                  Text(
                                    outOfTime.actualDuration.tommss(),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: SizedBox(
                                      height: 12,
                                      width: 12,
                                      child: ColoredBox(color: Colors.red),
                                    ),
                                  )
                                ],
                              ),
                            ]),
                          ],
                        ),
                      )
                    // Text('${outOfTime.role}: ${outOfTime.actualDuration.tommss()} : ${outOfTime.maxDuration.tommss()}'),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Color getMarkColor(EReportItem speaker) {
    if (speaker.iActualTime > speaker.iMaxTime || speaker.iActualTime < speaker.iMinTime) {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }

  String getSpeakerTimeMessage(EReportItem speaker) {
    if (speaker.iActualTime > speaker.iMaxTime) {
      return "Tiempo excedido";
    }
    if (speaker.iActualTime < speaker.iMinTime) {
      return "Tiempo no alcanzado";
    }
    return "En tiempo";
  }
}
