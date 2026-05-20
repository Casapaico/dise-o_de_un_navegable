import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

// Datos de ejemplo — en una app real vendrían de un provider o BD
final List<Map<String, String>> _alumnos = [
  {'nombres': 'María Lucía', 'apellidos': 'Ramírez Flores',
   'fecha': '12/03/2010'},
  {'nombres': 'Juan Pablo',  'apellidos': 'Torres Vega',
   'fecha': '05/07/2011'},
  {'nombres': 'Alondra',     'apellidos': 'Vega Salas',
   'fecha': '22/11/2009'},
];

class ListarAlumnosScreen extends StatelessWidget {
  const ListarAlumnosScreen({super.key});

  // Obtiene las iniciales del nombre
  String _iniciales(String nombres, String apellidos) {
    final n = nombres.isNotEmpty ? nombres[0] : '';
    final a = apellidos.isNotEmpty ? apellidos[0] : '';
    return '$n$a'.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alumnos (${_alumnos.length})'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const MainDrawer(),
      body: ListView.separated(
        itemCount: _alumnos.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final alumno = _alumnos[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.indigo.shade100,
              child: Text(
                _iniciales(
                    alumno['nombres']!, alumno['apellidos']!),
                style: const TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold),
              ),
            ),
            title: Text(
                '${alumno['nombres']} ${alumno['apellidos']}'),
            subtitle: Text('Nacido: ${alumno['fecha']}'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Aquí iría el detalle del alumno
            },
          );
        },
      ),
    );
  }
}