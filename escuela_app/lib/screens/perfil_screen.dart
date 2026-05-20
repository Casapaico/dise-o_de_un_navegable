import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const MainDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Avatar
          const CircleAvatar(
            radius: 40,
            backgroundColor: Colors.indigo,
            child: Text('CM',
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 8),
          const Center(
            child: Text('Carlos Mendoza',
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w600)),
          ),
          const Center(
            child: Text('Administrador',
                style: TextStyle(color: Colors.grey)),
          ),
          const SizedBox(height: 24),

          // Filas de datos
          _InfoRow(icon: Icons.badge_outlined,
              label: 'Nombres', value: 'Carlos Andrés'),
          _InfoRow(icon: Icons.person_outline,
              label: 'Apellidos', value: 'Mendoza Torres'),
          _InfoRow(icon: Icons.email_outlined,
              label: 'Correo', value: 'c.mendoza@escuela.com'),
          _InfoRow(icon: Icons.phone_outlined,
              label: 'Teléfono', value: '+51 987 654 321'),
          _InfoRow(icon: Icons.work_outline,
              label: 'Cargo', value: 'Administrador'),

          const SizedBox(height: 32),

          // Botón cerrar sesión
          OutlinedButton.icon(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
            icon: const Icon(Icons.logout, color: Colors.red),
            label: const Text('Cerrar sesión',
                style: TextStyle(color: Colors.red)),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.red),
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget auxiliar para cada fila de información
class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow(
      {required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.indigo),
          title: Text(label,
              style: const TextStyle(fontSize: 12, color: Colors.grey)),
          subtitle: Text(value,
              style: const TextStyle(
                  fontSize: 15, color: Colors.black87)),
          contentPadding: EdgeInsets.zero,
        ),
        const Divider(height: 1),
      ],
    );
  }
}