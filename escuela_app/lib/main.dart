import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/perfil_screen.dart';
import 'screens/registrar_alumno_screen.dart';
import 'screens/listar_alumnos_screen.dart';
import 'screens/faq_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Escuela App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      routes: {
        '/login':    (context) => const LoginScreen(),
        '/perfil':   (context) => const PerfilScreen(),
        '/registrar':(context) => const RegistrarAlumnoScreen(),
        '/listar':   (context) => const ListarAlumnosScreen(),
        '/faq':      (context) => const FaqScreen(),
      },
    );
  }
}