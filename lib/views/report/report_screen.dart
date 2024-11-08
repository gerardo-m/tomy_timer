import 'package:flutter/material.dart';

class ReportScreen extends StatelessWidget{
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reporte'),
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text('Inicio de reunión'),
          ),
          ListTile(
            title: Text('Estado de la reunion'),
            subtitle: Text('Retrasado: Hora actual : Hora programada'),
          ),
          ListTile(
            title: Text('Oradores'),
            subtitle: Column(
              children: [
                Text('Orador 1: Tiempo : asignado'),
                Text('Orador 2: Tiempo : asignado'),
                Text('Orador 2: Tiempo : asignado'),
              ],
            ),
          ),
          ListTile(
            title: Text('Retrasos'),
            subtitle: Column(
              children: [
                Text('Toastmaster'),
                Text('Miembro 1'),
                Text('Miembro 2'),
                Text('Miembro 3'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
  