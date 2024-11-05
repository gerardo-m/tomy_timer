import 'package:flutter/material.dart';
import 'package:tomy_timer/utils/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TomyTimer'),
      ),
      body: ListView(
        children:  [
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
                Navigator.of(context).pushNamed(TomyTimerRoutes.meeting);
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
  }
}
