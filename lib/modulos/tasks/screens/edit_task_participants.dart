import 'package:flutter/material.dart';

class EditTaskParticipantsScreen extends StatelessWidget {
  const EditTaskParticipantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asignar tarea'),
      ),
      body: Column(
        children: [
          Text('Lista de usuarios'),
          // Aquí puedes agregar tu lista de usuarios
          Text('Editar prioridad'),
          // Aquí puedes agregar tu campo de edición de prioridad
          Text('Seleccionar fecha'),
          // Aquí puedes agregar tu selector de fecha (por ejemplo, un DatePicker)
        ],
      ),
    );
  }
}
