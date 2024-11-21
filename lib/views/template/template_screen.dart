import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tomy_timer/models/template_item.dart';
import 'package:tomy_timer/utils/utils.dart';
import 'package:tomy_timer/views/template/cubit/template_cubit.dart';

class TemplateScreen extends StatelessWidget {
  const TemplateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplateBlocBuilder(builder: (context, state) {
      return PopScope(
        onPopInvoked: (didPop) async {
          await context.read<TemplateCubit>().finishedChangingName();
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Plantilla'),
          ),
          body: Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: ListView(
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
                  title: const Text('Hora de inicio'),
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
                    if (!context.mounted) return;
                    context.read<TemplateCubit>().changeScheduledTime(time);
                  },
                ),
                const Divider(),
                const Padding(
                  padding:  EdgeInsets.only(top:16),
                  child:  Center(child: Text('Programa')),
                ),
                for (ETemplateItem item in state.items)
                  ListTile(
                    title: Text('${item.role} - ${item.name}'),
                    subtitle: Text('${item.greenDuration?.tommss() ?? '00:00'} - ${item.redDuration.tommss()}'),
                    onTap: () async{
                      await Navigator.of(context).pushNamed(TomyTimerRoutes.templateItem, arguments: {"id": item.id});
                      await Future.delayed(const Duration(milliseconds: 500));
                      if (!context.mounted)return;
                      context.read<TemplateCubit>().load(state.template.id);
                    },
                  ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () async{
              int? id = await context.read<TemplateCubit>().createTemplateItem();
              if (!context.mounted)return;
              await Navigator.of(context).pushNamed(TomyTimerRoutes.templateItem, arguments: {"id": id});
              await Future.delayed(const Duration(milliseconds: 500));
              if (!context.mounted)return;
              context.read<TemplateCubit>().load(state.template.id);
            },
            label: const Text('Nuevo item'),
            icon: const Icon(Icons.add),
          ),
        ),
      );
    });
  }
}
