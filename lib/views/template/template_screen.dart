import 'package:flutter/material.dart';
import 'package:tomy_timer/views/template/cubit/template_cubit.dart';

class TemplateScreen extends StatelessWidget{
  const TemplateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplateBlocBuilder(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Plantilla'),
          ),
          body: ListView(
            children: [
              ListTile(
                title: const Text('Nombre'),
                subtitle: TextField(
                  controller: TextEditingController(text: state.template.name),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
  