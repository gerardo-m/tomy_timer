import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tomy_timer/models/template.dart';
import 'package:tomy_timer/utils/utils.dart';
import 'package:tomy_timer/views/templates/cubit/templates_cubit.dart';

class TemplatesScreen extends StatelessWidget {
  const TemplatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplatesBlocBuilder(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Plantillas'),
          ),
          body: ListView(
            children: [
              for (ETemplate template in state.templates)
                ListTile(
                  title: Text(template.name),
                  onTap: () {
                     Navigator.of(context).pushNamed(TomyTimerRoutes.template, arguments: {"id": template.id});
                  },
                )
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () async{
              int? id = await context.read<TemplatesCubit>().createTemplate();
              if (!context.mounted)return;
              await Navigator.of(context).pushNamed(TomyTimerRoutes.template, arguments: {"id": id});
              if (!context.mounted)return;
              context.read<TemplatesCubit>().load();
            },
            label: const Text('Nueva plantilla'),
            icon: const Icon(Icons.add),
          ),
        );
      }
    );
  }
}
