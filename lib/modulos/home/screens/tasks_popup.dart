

import 'package:flutter/material.dart';

import '../../../domain/entities/assigned_task.dart';

class TasksPopup extends StatelessWidget{

  final List<AssignedTask>? tasks;

  const TasksPopup({super.key, required this.tasks});
  

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Tareas', textAlign: TextAlign.center,style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),),
      content: Container(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: tasks?.isEmpty ?? true ? [
            const Center(child: Text('No hay tareas asignadas para este día')),
          ] :
          tasks?.map((AssignedTask task) {
            return ListTile(
              title: Row(
                children: [
                  Expanded(child: Text(task.task!.name!,style: const TextStyle(fontWeight: FontWeight.bold))),
                  const SizedBox(width: 16.0),
                  Row(
                    children: [
                      const Text("Realizada: ", style: TextStyle(fontSize: 10.0),  textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                      ),
                      task.done == 1 ? const Icon(Icons.check) : const Icon(Icons.close),
                    ]
                  )
                ],
              ),
              subtitle: Text(task.task!.description),
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
          child: const Text('Cerrar'),

        ),
        ElevatedButton(
          onPressed: () {
            // Agregar lógica para manejar el botón "Agregar"
            // Puedes abrir otro popup para ingresar información adicional
            // o realizar cualquier acción que desees.
          },
          child: const Text('Agregar'),
        ),
      ],
    );
  }

}