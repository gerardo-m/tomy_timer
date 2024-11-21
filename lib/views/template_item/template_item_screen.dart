import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:duration_spinbox/duration_spinbox.dart';
import 'package:flutter/material.dart';
import 'package:tomy_timer/utils/utils.dart';
import 'package:tomy_timer/views/template_item/cubit/template_item_cubit.dart';

class TemplateItemScreen extends StatelessWidget {
  const TemplateItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplateItemBlocBuilder(builder: (context, state) {
      return PopScope(
        onPopInvoked: (didPop) async{
          await context.read<TemplateItemCubit>().save();
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Item de plantilla'),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  ListTile(
                    title: const Text('Nombre'),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: TextEditingController(text: state.item.name),
                        onChanged: (value) {
                          context.read<TemplateItemCubit>().changeName(value);
                        },
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text('Rol'),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: TextEditingController(text: state.item.role),
                        onChanged: (value) {
                          context.read<TemplateItemCubit>().changeRole(value);
                        },
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text('Hora de inicio'),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(state.item.scheduledStartTime.tohhmm()),
                    ),
                    onTap: ()async{
                      TimeOfDay? time = await showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(state.item.scheduledStartTime));
                      if (time == null)return;
                      if (!context.mounted)return;
                      context.read<TemplateItemCubit>().changeScheduledTime(time);
                    }
                  ),
                  CheckboxListTile(
                    value: state.item.roleType == RoleType.speaker,
                    title: const Text('Es orador'),
                    onChanged: (value) {
                      if (value ?? false) {
                        context.read<TemplateItemCubit>().changeRoleType(RoleType.speaker);
                      } else {
                        context.read<TemplateItemCubit>().changeRoleType(RoleType.nonSpeaker);
                      }
                    },
                  ),
                  ListTile(
                    title: const Text('Tiempo verde'),
                    subtitle: DurationSpinbox(
                      value: state.item.greenDuration ?? Duration.zero,
                      onChanged: (value) {
                        context.read<TemplateItemCubit>().changeGreenTime(value);
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Tiempo amarillo'),
                    subtitle: DurationSpinbox(
                      value: state.item.ambarDuration ?? Duration.zero,
                      onChanged: (value) {
                        context.read<TemplateItemCubit>().changeAmbarTime(value);
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Tiempo rojo'),
                    subtitle: DurationSpinbox(
                      value: state.item.redDuration,
                      onChanged: (value) {
                        context.read<TemplateItemCubit>().changeRedTime(value);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
