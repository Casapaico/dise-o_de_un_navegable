import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class RegistrarAlumnoScreen extends StatefulWidget {
  const RegistrarAlumnoScreen({super.key});

  @override
  State<RegistrarAlumnoScreen> createState() =>
      _RegistrarAlumnoScreenState();
}

class _RegistrarAlumnoScreenState
    extends State<RegistrarAlumnoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nombresCtrl = TextEditingController();
  final _apellidosCtrl = TextEditingController();
  final _fechaCtrl = TextEditingController();

  Future<void> _seleccionarFecha() async {
    // Abre el date picker nativo de Flutter
    final fecha = await showDatePicker(
      context: context,
      initialDate: DateTime(2010),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (fecha != null) {
      // Formatea DD/MM/YYYY
      _fechaCtrl.text =
          '${fecha.day.toString().padLeft(2, '0')}/${fecha.month.toString().padLeft(2, '0')}/${fecha.year}';
    }
  }

  void _grabar() {
    if (_formKey.currentState!.validate()) {
      // Aquí irían: guardar en lista, enviar a API, etc.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Alumno registrado correctamente'),
          backgroundColor: Colors.green,
        ),
      );
      _formKey.currentState!.reset();
      _nombresCtrl.clear();
      _apellidosCtrl.clear();
      _fechaCtrl.clear();
    }
  }

  @override
  void dispose() {
    _nombresCtrl.dispose();
    _apellidosCtrl.dispose();
    _fechaCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar alumno'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const MainDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Nombres
              TextFormField(
                controller: _nombresCtrl,
                decoration: const InputDecoration(
                  labelText: 'Nombres',
                  prefixIcon: Icon(Icons.person_outline),
                  border: OutlineInputBorder(),
                ),
                validator: (v) =>
                    (v == null || v.isEmpty) ? 'Campo requerido' : null,
              ),
              const SizedBox(height: 16),

              // Apellidos
              TextFormField(
                controller: _apellidosCtrl,
                decoration: const InputDecoration(
                  labelText: 'Apellidos',
                  prefixIcon: Icon(Icons.person_outline),
                  border: OutlineInputBorder(),
                ),
                validator: (v) =>
                    (v == null || v.isEmpty) ? 'Campo requerido' : null,
              ),
              const SizedBox(height: 16),

              // Fecha con date picker
              TextFormField(
                controller: _fechaCtrl,
                readOnly: true, // solo se llena con el picker
                decoration: InputDecoration(
                  labelText: 'Fecha de nacimiento',
                  prefixIcon: const Icon(Icons.calendar_today_outlined),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.edit_calendar),
                    onPressed: _seleccionarFecha,
                  ),
                ),
                onTap: _seleccionarFecha,
                validator: (v) =>
                    (v == null || v.isEmpty) ? 'Selecciona una fecha' : null,
              ),
              const SizedBox(height: 32),

              // Botón grabar
              ElevatedButton.icon(
                onPressed: _grabar,
                icon: const Icon(Icons.save_outlined),
                label: const Text('Grabar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}