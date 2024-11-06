import 'package:flutter/material.dart';
import 'package:tomy_timer/utils/duration_extension.dart';
import 'package:tomy_timer/views/meeting/clock/cubit/clock_cubit.dart';

class ClockWidget extends StatelessWidget {
  const ClockWidget({
    super.key,
    this.startingDuration = Duration.zero,
    this.running = false,
  });

  final Duration startingDuration;
  final bool running;

  final _mainText = const TextStyle(fontSize: 50, fontWeight: FontWeight.bold);
  final _secondText = const TextStyle(fontSize: 20);

  @override
  Widget build(BuildContext context) {
    return ClockBlocBuilder(
      builder: (context, state) {
        return Column(
          children: [
            Text(state.duration.tommssxx(), style: _mainText,),
            Text('04:00', style: _secondText),
          ],
        );
      },
    );
  }
}
