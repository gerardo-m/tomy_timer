import 'package:flutter/material.dart';
import 'package:tomy_timer/utils/enums.dart';
import 'package:tomy_timer/utils/routes.dart';
import 'package:tomy_timer/views/home/cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              onSelected: (value) async{
                switch (value) {
                  case HomeScreenOptions.settings:
                    await Navigator.of(context).pushNamed(TomyTimerRoutes.settings);
                    if (!context.mounted)return;
                    context.read<HomeCubit>().load();
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
                  onTap: () async {
                    await Navigator.of(context).pushNamed(TomyTimerRoutes.meeting, arguments: {
                      "id": state.currentMeeting?.id,
                    });
                    if (!context.mounted)return;
                    context.read<HomeCubit>().load();
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
          onPressed: () async{
            await Navigator.of(context).pushNamed(TomyTimerRoutes.meeting);
            if (!context.mounted)return;
            context.read<HomeCubit>().load();
          },
          label: const Text('Nueva reunion'),
          icon: const Icon(Icons.add),
        ),
      );
    });
  }
}
