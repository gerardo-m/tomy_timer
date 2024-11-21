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
    this.milestoneEditable = true,
  });

  final Duration startingDuration;
  final bool running;
  final bool milestoneEditable;

  final _mainText = const TextStyle(fontSize: 50, fontWeight: FontWeight.bold);
  final _secondText = const TextStyle(fontSize: 20);

  @override
  Widget build(BuildContext context) {
    return ClockBlocBuilder(
      builder: (context, state) {
        return Container(
          
          decoration: BoxDecoration(
            color: state.color,
          ),
          child: Column(
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
                  Text(
                      state.nextMilestone == Duration.zero
                          ? '¡Se acabó el tiempo!'
                          : 'Próximo hito: ${state.nextMilestone.tommss()}',
                      style: _secondText),
                  if (milestoneEditable)
                    IconButton(
                      onPressed: () {
                        _showMilestoneDialog(context, state.meetingItem!);
                      },
                      icon: const Icon(Icons.edit),
                    ),
                ],
              ),
            ],
          ),
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
            DurationSpinbox(value: meetingItem.greenDuration ?? Duration.zero),
            DurationSpinbox(value: meetingItem.ambarDuration ?? Duration.zero),
            DurationSpinbox(value: meetingItem.redDuration),
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
