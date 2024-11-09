import 'package:duration_spinbox/duration_spinbox.dart';
import 'package:flutter/material.dart';
import 'package:tomy_timer/models/meeting_item.dart';
import 'package:tomy_timer/utils/duration_extension.dart';
import 'package:tomy_timer/views/meeting/clock/cubit/clock_cubit.dart';

class ClockWidget extends StatelessWidget {
  const ClockWidget({
    super.key,
    this.startingDuration = Duration.zero,
    this.running = false,
    required this.meetingItem,
  });

  final Duration startingDuration;
  final bool running;
  final EMeetingItem meetingItem;

  final _mainText = const TextStyle(fontSize: 50, fontWeight: FontWeight.bold);
  final _secondText = const TextStyle(fontSize: 20);

  @override
  Widget build(BuildContext context) {
    return ClockBlocBuilder(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Text(
                state.duration.tommssxx(),
                style: _mainText,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text('Próximo hito: ${state.nextMilestone.tommss()}', style: _secondText),
                IconButton(
                  onPressed: () {
                    _showMilestoneDialog(context, meetingItem);
                  },
                  icon: const Icon(Icons.edit),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Future<void> _showMilestoneDialog(BuildContext context, EMeetingItem meetingItem) async {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Center(child: Text('Tiempos')),
          contentPadding: const EdgeInsets.all(8),
          children: [
            DurationSpinbox(value: meetingItem.greenTime ?? Duration.zero),
            DurationSpinbox(value: meetingItem.ambarTime ?? Duration.zero),
            DurationSpinbox(value: meetingItem.redTime),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }
}
