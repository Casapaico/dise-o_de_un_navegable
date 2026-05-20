import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Cabecera del drawer
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.indigo),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: Colors.indigo),
                ),
                SizedBox(height: 8),
                Text('Carlos Mendoza',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
                Text('Administrador',
                    style: TextStyle(color: Colors.white70, fontSize: 13)),
              ],
            ),
          ),

          // Opción 1: Perfil
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('Perfil'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/perfil');
            },
          ),

          // Opción 2: Registrar alumno
          ListTile(
            leading: const Icon(Icons.person_add_outlined),
            title: const Text('Registrar alumno'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/registrar');
            },
          ),

          // Opción 3: Listar alumnos
          ListTile(
            leading: const Icon(Icons.list_alt_outlined),
            title: const Text('Listar alumnos'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/listar');
            },
          ),

          // Opción 4: Preguntas frecuentes
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('Preguntas frecuentes'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/faq');
            },
          ),

          const Divider(),

          // Opción 5: Cerrar sesión
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Cerrar sesión',
                style: TextStyle(color: Colors.red)),
            onTap: () {
              // Elimina todo el historial y vuelve al login
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}