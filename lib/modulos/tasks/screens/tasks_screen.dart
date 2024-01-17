import 'package:flutter/material.dart';
import 'package:gestor_del_hogar/domain/entities/itinerary.dart';
import 'package:gestor_del_hogar/modulos/tasks/controller/task_controller.dart';
import 'package:gestor_del_hogar/presentation/shared/widgets/generic_card.dart';

import '../../../domain/entities/task.dart';

class TasksScreen extends StatelessWidget {
  static const name = 'tasks';

  // ignore: use_key_in_widget_constructors
  const TasksScreen();

  @override
  Widget build(BuildContext context) {
    final tasks = _getTasks();
    final itinearies = _getItineraries();
    return Scaffold(
        appBar: AppBar(
            title:
                Text('Tareas', style: Theme.of(context).textTheme.titleMedium),
            centerTitle: true),
        body: SingleChildScrollView(
                child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text("Tareas", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              FutureBuilder(
                future: tasks,
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
                          return tasksList(context, index, snapshot.data);
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
              const Text(
                "Itinerarios",
                 style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.start,),
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
  TaskController taskController = TaskController();
  return await taskController.getTasks();
}

_getItineraries() async {
  TaskController taskController = TaskController();
  return await taskController.getItineraries();
}

Widget tasksList(BuildContext context, int index, List<Task>? tasks) {
  final ThemeData theme = Theme.of(context);

  return GenericCard(
      name: tasks![index].name!,
      icon1: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.supervisor_account_outlined), 
        color: theme.primaryColor
      ),
      icon2: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.more_vert), 
        color: theme.primaryColor
      ),
  );
}

Widget itineraryList(
    BuildContext context, int index, List<Itinerary>? itineraries) {
  final ThemeData theme = Theme.of(context);

  return GenericCard(
      name: itineraries![index].name!,
      icon1: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.supervisor_account_outlined), 
        color: theme.primaryColor
      ),
      icon2: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.more_vert), 
        color: theme.primaryColor
      ),
  );
}
