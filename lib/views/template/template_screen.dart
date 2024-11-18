import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tomy_timer/utils/datetime_extension.dart';
import 'package:tomy_timer/views/template/cubit/template_cubit.dart';

class TemplateScreen extends StatelessWidget {
  const TemplateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplateBlocBuilder(builder: (context, state) {
      return PopScope(
        onPopInvoked: (didPop) {
          context.read<TemplateCubit>().finishedChangingName();
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Plantilla'),
          ),
          body: ListView(
            children: [
              ListTile(
                title: const Text('Nombre'),
                subtitle: TextField(
                  controller: TextEditingController(text: state.template.name),
                  onChanged: (value) {
                    context.read<TemplateCubit>().changeName(value);
                  },
                  onEditingComplete: () {
                    context.read<TemplateCubit>().finishedChangingName();
                  },
                ),
              ),
              ListTile(
                title: const Text('Hora de comienzo'),
                subtitle: Text(state.template.scheduledStartingTime.tohhmm()),
                onTap: () async {
                  TimeOfDay? time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay(
                      hour: state.template.scheduledStartingTime.hour,
                      minute: state.template.scheduledStartingTime.minute,
                    ),
                  );
                  if (time == null) return;
                  if (!context.mounted)return;
                  context.read<TemplateCubit>().changeScheduledTime(time);
                },
              )
            ],
          ),
        ),
      );
    });
  }
}
