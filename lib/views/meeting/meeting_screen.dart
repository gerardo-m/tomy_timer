import 'package:flutter/material.dart';

class MeetingScreen extends StatelessWidget {
  const MeetingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reunión'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [Text('Contador de muletillas'), Text('Nitzu Higimani')],
            ),
            Text('Clock'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Back'),
                Text('Start/Resume'),
                Text('Stop/Next'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
