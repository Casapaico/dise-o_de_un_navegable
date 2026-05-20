import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

// Lista de preguntas y respuestas
const List<Map<String, String>> _faqs = [
  {
    'pregunta': '¿Cómo registro un nuevo alumno?',
    'respuesta':
        'Ve al menú lateral y selecciona "Registrar alumno". '
        'Completa los campos de nombres, apellidos y fecha de '
        'nacimiento, luego presiona el botón "Grabar".',
  },
  {
    'pregunta': '¿Cómo veo la lista de alumnos?',
    'respuesta':
        'Desde el menú lateral elige "Listar alumnos". '
        'Verás todos los alumnos registrados con su nombre '
        'y fecha de nacimiento.',
  },
  {
    'pregunta': '¿Cómo cierro sesión?',
    'respuesta':
        'Puedes cerrar sesión desde el menú lateral '
        '(última opción en rojo) o desde la pantalla de '
        'Perfil con el botón "Cerrar sesión".',
  },
];

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preguntas frecuentes'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const MainDrawer(),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: _faqs.length,
        itemBuilder: (context, index) {
          final faq = _faqs[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ExpansionTile(
              // Ícono de pregunta
              leading: CircleAvatar(
                backgroundColor: Colors.indigo.shade50,
                child: Text('${index + 1}',
                    style: const TextStyle(color: Colors.indigo)),
              ),
              title: Text(faq['pregunta']!,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500)),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Text(faq['respuesta']!,
                      style: const TextStyle(
                          fontSize: 14, color: Colors.black87)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}