

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/assigned_task.dart';
import '../../../domain/entities/task.dart';

class TasksPopup extends StatelessWidget{

  final List<AssignedTask>? tasks;

  const TasksPopup({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Tareas'),
      content: Container(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: tasks?.map((AssignedTask task) {
            return ListTile(
              title: Text(task.task!.name!),
              subtitle: Text(task.task!.description!),

            );
          }).toList() ?? [],

        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            // Agregar lógica para cerrar el popup
            Navigator.of(context).pop();
          },
          child: Text('Cerrar'),

        ),
        ElevatedButton(
          onPressed: () {
            // Agregar lógica para manejar el botón "Agregar"
            // Puedes abrir otro popup para ingresar información adicional
            // o realizar cualquier acción que desees.
          },
          child: Text('Agregar'),
        ),
      ],
    );
  }

}