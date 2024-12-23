import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dialog_helper/flutter_dialog_helper.dart';
import 'package:tomy_timer/utils/utils.dart';
import 'package:tomy_timer/views/meeting/clock/clock_widget.dart';
import 'package:tomy_timer/views/meeting/clock/cubit/clock_cubit.dart';
import 'package:tomy_timer/views/meeting/cubit/meeting_cubit.dart';

class MeetingScreen extends StatelessWidget {
  const MeetingScreen({super.key});

  final _roleText = const TextStyle(fontSize: 24);
  final _nameText = const TextStyle(fontSize: 20);

  @override
  Widget build(BuildContext context) {
    return MeetingBlocBuilder(builder: (context, state) {
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
                          state.meetingItems[state.selectedItem].role,
                          style: _roleText,
                        ),
                        IconButton(
                            onPressed: () async {
                              String? newRole = await showPromtDialog(context, 'Rol',
                                  initialValue: state.meetingItems[state.selectedItem].role);
                              if (newRole == null) return;
                              if (!context.mounted) return;
                              await context.read<MeetingCubit>().changeRole(newRole);
                            },
                            icon: const Icon(Icons.edit)),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        state.meetingItems[state.selectedItem].name,
                        style: _nameText,
                      ),
                      IconButton(
                          onPressed: () async {
                            String? newName = await showPromtDialog(context, 'Nombre',
                                initialValue: state.meetingItems[state.selectedItem].name);
                            if (newName == null) return;
                            if (!context.mounted) return;
                            await context.read<MeetingCubit>().changeName(newName);
                          },
                          icon: const Icon(Icons.edit)),
                    ],
                  ),
                ],
              ),
              const Expanded(
                child: ClockWidget(),
              ),
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
                          await context.read<MeetingCubit>().playAction();
                          if (!context.mounted) return;
                          context.read<ClockCubit>().start();
                        },
                        text: 'Start Resume',
                        icon: Icons.play_arrow,
                      ),
                      _MeetingActionButton(
                        onPressed: () async {
                          await context.read<MeetingCubit>().stopNextAction();
                          if (!context.mounted) return;
                          context.read<ClockCubit>().stop();
                          if (state.selectedItem == state.meetingItems.length - 1) {
                            RoleType? roleType = await _getRoleType(context);
                            if (!context.mounted) return;
                            if (roleType == null) {
                              await _finishMeeting(context);
                            } else {
                              await context.read<MeetingCubit>().setMilestones(roleType);
                            }
                            if (!context.mounted) return;
                          }
                          context.read<ClockCubit>().reset();
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
                              Navigator.of(context)
                                  .pushNamed(TomyTimerRoutes.report, arguments: {"meeting_id": state.meeting.id});
                            },
                            child: const Text('Ver reporte'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                          child: ElevatedButton(
                            onPressed: () async {
                              bool? confirm = await showConfirmationDialog(context, 'Finalizar',
                                  '¿Está seguro de finalizar? No se podrá editar después de esta acción');
                              if (!(confirm ?? false)) return;
                              if (!context.mounted) return;
                              await _finishMeeting(context);
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
    });
  }

  Future<void> _finishMeeting(BuildContext context) async {
    int? reportId = await context.read<MeetingCubit>().finishMeeting();
    if (!context.mounted) return;
    if (reportId == null) {
      showErrorMessage(context, 'Ocurrió un error generando el reporte');
      return;
    }
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed(TomyTimerRoutes.report, arguments: {"id": reportId});
  }

  Future<RoleType?> _getRoleType(BuildContext context) async {
    return showDialog<RoleType>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text('Fue el último participante registrado. ¿Deseas agregar otro?'),
          children: [
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop(RoleType.speaker);
              },
              child: const Text('Orador'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop(RoleType.nonSpeaker);
              },
              child: const Text('Otro rol'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Finalizar reunión'),
            ),
          ],
        );
      },
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
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: ElevatedButton(
          onPressed: onPressed,
          child: SizedBox(
            height: 80,
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
        ),
      ),
    );
  }
}
