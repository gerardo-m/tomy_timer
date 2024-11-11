import 'package:flutter/material.dart';
import 'package:tomy_timer/utils/enums.dart';
import 'package:tomy_timer/utils/routes.dart';
import 'package:tomy_timer/views/home/cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeBlocBuilder(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('TomyTimer'),
          actions: [
            PopupMenuButton(
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: HomeScreenOptions.settings,
                  child: Text('Ajustes'),
                ),
              ],
              onSelected: (value) {
                switch (value) {
                  case HomeScreenOptions.settings:
                    Navigator.of(context).pushNamed(TomyTimerRoutes.settings);
                    break;
                  default:
                }
              },
            ),
          ],
        ),
        body: ListView(
          children: [
            if (state.currentMeeting != null)
              Card(
                child: ListTile(
                  minVerticalPadding: 14,
                  title: const Text('Reunión en marcha'),
                  subtitle: const Column(
                    children: [
                      Text('Details'),
                      Text('Details'),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(TomyTimerRoutes.meeting, arguments: {"id": state.currentMeeting?.id});
                  },
                ),
              ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(TomyTimerRoutes.pastMeetings);
              },
              child: const Text('Ver reuniones pasadas'),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).pushNamed(TomyTimerRoutes.meeting);
          },
          label: const Text('Nueva reunion'),
          icon: const Icon(Icons.add),
        ),
      );
    });
  }
}