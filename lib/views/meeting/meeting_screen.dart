import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tomy_timer/utils/routes.dart';
import 'package:tomy_timer/views/meeting/clock/clock_widget.dart';
import 'package:tomy_timer/views/meeting/clock/cubit/clock_cubit.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Column(
              children: [Text('Contador de muletillas'), Text('Nitzu Higimani')],
            ),
            const ClockWidget(),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text('Back'),
                    ElevatedButton(
                      onPressed: () async {
                        context.read<ClockCubit>().start();
                      },
                      child: const Text('Start/Resume'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<ClockCubit>().stop();
                      },
                      child: const Text('Stop/Next'),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(TomyTimerRoutes.report);
                  },
                  child: const Text('Finalizar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
