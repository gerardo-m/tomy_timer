import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dialog_helper/flutter_dialog_helper.dart';
import 'package:tomy_timer/utils/routes.dart';
import 'package:tomy_timer/views/meeting/clock/clock_widget.dart';
import 'package:tomy_timer/views/meeting/clock/cubit/clock_cubit.dart';

class MeetingScreen extends StatelessWidget {
  const MeetingScreen({super.key});

  final _roleText = const TextStyle(fontSize: 24);
  final _nameText = const TextStyle(fontSize: 20);

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
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Contador de muletillas',
                        style: _roleText,
                      ),
                      IconButton(
                          onPressed: () {
                            showPromtDialog(context, 'Rol', initialValue: 'Contador de muletillas');
                          },
                          icon: const Icon(Icons.edit)),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Nitzu Higimani',
                      style: _nameText,
                    ),
                    IconButton(
                        onPressed: () {
                          showPromtDialog(context, 'Nombre', initialValue: 'Nitzu Higimani');
                        },
                        icon: const Icon(Icons.edit)),
                  ],
                ),
              ],
            ),
            const Expanded(child: ClockWidget()),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _MeetingActionButton(
                      onPressed: () {},
                      text: 'Back',
                      icon: Icons.arrow_back,
                    ),
                    _MeetingActionButton(
                      onPressed: () async {
                        context.read<ClockCubit>().start();
                      },
                      text: 'Start Resume',
                      icon: Icons.play_arrow,
                    ),
                    _MeetingActionButton(
                      onPressed: () {
                        context.read<ClockCubit>().stop();
                      },
                      text: 'Stop Next',
                      icon: Icons.stop,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(TomyTimerRoutes.report);
                          },
                          child: const Text('Finalizar'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MeetingActionButton extends StatelessWidget {
  const _MeetingActionButton({
    required this.onPressed,
    required this.text,
    required this.icon,
  });

  final void Function()? onPressed;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: SizedBox(
        height: 80,
        width: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(icon),
            Text(
              text,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
