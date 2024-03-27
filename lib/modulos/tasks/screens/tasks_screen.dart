import 'package:flutter/material.dart';
import 'package:gestor_del_hogar/core/states_managment/custom_listenable_widget.dart';
import 'package:gestor_del_hogar/domain/entities/itinerary.dart';
import 'package:gestor_del_hogar/modulos/tasks/controller/task_controller.dart';
import 'package:gestor_del_hogar/modulos/tasks/screens/asign_task.dart';
import 'package:gestor_del_hogar/modulos/tasks/screens/create_task_screen.dart';
import 'package:gestor_del_hogar/modulos/tasks/screens/edit_task_form.dart';
import 'package:gestor_del_hogar/presentation/shared/shared.dart';
import 'package:gestor_del_hogar/presentation/shared/widgets/generic_card.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/entities/task.dart';
import '../../../presentation/shared/widgets/tree_dot_menu_button.dart';

TaskController taskController = TaskController();

class TasksScreen extends StatelessWidget {
  static const name = 'tasks';

  // ignore: use_key_in_widget_constructors
  const TasksScreen();

  @override
  Widget build(BuildContext context) {
    _getTasks();
    final itinearies = _getItineraries();
    return Scaffold(
        appBar: AppBar(
            title:
                Text('Tareas', style: Theme.of(context).textTheme.titleMedium),
            centerTitle: true),
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          children: [
            SpeedDialChild(
                child: const Icon(Icons.add_task_outlined),
                label: 'Crear tarea',
                onTap: () => context.push('/create-task-screen')),
            SpeedDialChild(
              child: const Icon(Icons.note_add_outlined),
              label: 'Crear itinerario',
              onTap: () => context.push('/create-itinerary-screen'),
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Align (
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Tareas",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              CustomListenableWidget(
                  valueListenable: taskController.taskList,
                  builder: (context, tasks, child) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: tasks?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return tasksList(context, index, tasks);
                      },
                    );
                  }),

              const SizedBox(height: 50),
              const Align (
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Itinerarios",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              FutureBuilder(
                future: itinearies,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.isEmpty) {
                      return const Center(
                        child: Text(
                          "No hay tareas todavia",
                          textAlign: TextAlign.center,
                        ),
                      );
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return itineraryList(context, index, snapshot.data);
                        },
                      );
                    }
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                },
              ),
              const SizedBox(height: 20),
              //_itineraryList(context),
            ],
          ),
        )));
  }
}

_getTasks() async {
  return await taskController.loadTasks();
}

_getItineraries() async {
  return await taskController.getItineraries();
}

Widget tasksList(BuildContext context, int index, List<Task>? tasks) {
  final ThemeData theme = Theme.of(context);

  return GenericCard(
    name: tasks![index].name!,
    description: tasks[index].description!,
    icon1: IconButton(
        onPressed: () {
          _assignTask(context, tasks[index]);
        },
        icon: const Icon(Icons.supervisor_account_outlined),
        color: theme.primaryColor),
    treedotmenuButton: ThreeDotMenuButton(
      onEditPressed: () {
        _editTask(context, tasks[index]);
      },
      onDeletePressed: () {
        _deleteTask(context, tasks[index]);
      },
    ),
  );
}

_assignTask(BuildContext context, Task task) {
  final size = MediaQuery.of(context).size;

  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: SizedBox(
            height: size.height - 200, // 80 los dos sizebox y 100 el ícono
            width: double.infinity,
            child: AsignTaskScreen(task: task),
          ),
        ),
      );
    },
  );
}

_editTask(BuildContext context, Task task) {
  final size = MediaQuery.of(context).size;

  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SizedBox(
              height: size.height - 200, // 80 los dos sizebox y 100 el ícono
              width: double.infinity,
              child: EditTaskForm(task: task),
            ),
          ),
        );
      });
}

_deleteTask(BuildContext context, Task task) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Eliminar tarea'),
        content: const Text('¿Estás seguro de que deseas eliminar esta tarea?'),
        actions: [
          TextButton(
            onPressed: () {
              taskController.deleteTask(task);
              Navigator.of(context).pop();
            },
            child: const Text('Aceptar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancelar'),
          ),
        ],
      );
    },
  );
}
