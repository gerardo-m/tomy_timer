import 'package:flutter/material.dart';

class PastMeetingsScreen extends StatelessWidget{
  const PastMeetingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PastMeetings'),
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text('Reunion 10-10-2024'),
          ),
          ListTile(
            title: Text('Reunion 10-10-2024'),
          ),
          ListTile(
            title: Text('Reunion 10-10-2024'),
          ),
          ListTile(
            title: Text('Reunion 10-10-2024'),
          ),
          ListTile(
            title: Text('Reunion 10-10-2024'),
          ),
        ],
      ),
    );
  }
}
  