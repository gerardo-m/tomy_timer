import 'package:flutter/material.dart';
import 'package:flutter_dialog_helper/flutter_dialog_helper.dart';
import 'package:tomy_timer/views/settings/cubit/settings_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget{
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsBlocBuilder(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Settings'),
          ),
          body: ListView(
            children: [
              ListTile(
                title: const Text('Reset db ¡PELIGRO!'),
                onTap: () async{
                  bool? confirm = await showConfirmationDialog(context, 'Reset DB', '¿Está seguro que desea resetear la DB?, esta operación no se puede deshacer');
                  if (confirm ?? false){
                    if (!context.mounted) return;
                    await context.read<SettingsCubit>().resetDb();
                    if (!context.mounted) return;
                    showSuccessMessage(context, '');
                  }
                },
              )
            ],
          ),
        );
      }
    );
  }
}
  