import 'package:flutter/material.dart';

class ClockWidget extends StatelessWidget {
  const ClockWidget({
    super.key,
    this.startingDuration = Duration.zero,
    this.running = false,
  });

  final Duration startingDuration;
  final bool running;

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('00:00:00'),
        Text('04:00'),
      ],
    );
  }
}
