import 'package:flutter/material.dart';
import 'package:gestor_del_hogar/modulos/tasks/screens/create_itinerary_form.dart';

import '../../../core/states_managment/state_manager.dart';
import '../../../domain/entities/itinerary.dart';
import '../../../domain/entities/task.dart';
import '../../../modulos/tasks/controller/task_controller.dart';

final TaskController taskController = TaskController();

class GenericPulsableCard extends StatefulWidget {
  final tasks = StateManager.getListenableBean<List<ItineraryTask>>([]);
  SelectedTasksController controller;
  final int dayOfWeek;

  void setSelectedTasks(List<ItineraryTask> value) {
    tasks.value = value;
  }

  GenericPulsableCard({super.key, required this.controller, required this.dayOfWeek});

  @override
  // ignore: library_private_types_in_public_api
  _GenericPulsableCardState createState() => _GenericPulsableCardState();
}

class _GenericPulsableCardState extends State<GenericPulsableCard> {
  final tasks_ = _getTasks();
  List<bool> isPressed = [];
  late List<ItineraryTask> _value;

  @override
  void initState() {
    super.initState();
    _getTasks().then((value) {
      setState(() {
        isPressed = List<bool>.filled(value.length, false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: tasks_,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
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
                return Column(
                  children: [
                    if (index == 0)
                      Row(
                        children: [
                          const SizedBox(width: 20),
                          const Expanded(
                            child: Text('Tareas'),
                          ),
                          IconButton(
                            onPressed: () {
                             
                              widget.controller.setValue(widget.tasks.value
                                  .where((element) => isPressed[widget.tasks.value.indexOf(element)])
                                  .map((element) => ItineraryTask(
                                      dayOfWeek: widget.dayOfWeek,
                                      lstTasks: element.lstTasks,
                                      deleleted: 0,
                                      ))
                                  .toList());
                              Navigator.pop(
                                context,
                              );
                            },
                            icon: const Icon(Icons.add),
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                    _tasksList(context, index, snapshot.data[index]),
                  ],
                );
              },
            );
          }
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }

  _tasksList(BuildContext context, int index, data) {
    ThemeData theme = Theme.of(context);

    return InkWell(
      onTap: () {
        setState(() {
          isPressed[index] = !isPressed[index];
        });
        if (isPressed[index]) {
          widget.tasks.value.add(ItineraryTask(
              id: data.id, lstTasks: Task(id: data.id, name: data.name) as List<Task>));  
        } else {
          widget.tasks.value.removeWhere((element) => element.id == data.id);
        }
      },
      child: Card(
        color: isPressed[index] ? theme.primaryColor : theme.primaryColorDark,
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.name,
                        style: Theme.of(context).textTheme.titleSmall),
                    const SizedBox(height: 8),
                    Text(data.description,
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_getTasks() async {
  return await taskController.getTasks();
}
