import 'package:flutter/material.dart';
import 'package:gestor_del_hogar/core/states_managment/custom_listenable_widget.dart';
import 'package:gestor_del_hogar/modulos/tasks/controller/task_status.dart';
import 'package:gestor_del_hogar/modulos/tasks/screens/create_itinerary_form.dart';

import '../../../core/states_managment/state_manager.dart';
import '../../../domain/entities/itinerary.dart';
import '../../../domain/entities/task.dart';
import '../../../modulos/tasks/controller/task_controller.dart';

class GenericPulsableCard extends StatelessWidget {
  final taskController = StateManager.getInstance().get<TaskController>();
  final taskStatusController = StateManager.getInstance().get<TaskStatus>();
  final tasks = StateManager.getListenableBean<List<ItineraryTask>>([]);
  final int dayOfWeek;
  GenericPulsableCard({super.key, required this.dayOfWeek});

  @override
  Widget build(BuildContext context) {
    taskStatusController.addTasksStatus(taskController.taskList.value!);
    return CustomListenableWidget(
        valueListenable: taskController.taskList,
        builder: (context, tasks, child) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: tasks?.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  _taskCard(context, index, tasks!),
                ],
              );
            },
          );
        });
  }

  _taskCard(BuildContext context, int index, data) {
    ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: () {
        taskStatusController.updaTasksStatus(
            data[index].id.toString(),
            !taskStatusController
                .tasksStatus.value[data[index].id.toString()]!);
      },
      child: CustomListenableWidget(
        valueListenable: taskStatusController.tasksStatus,
        builder: (context, userStatus, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Card(
              color: userStatus.containsKey(data[index].id.toString()) &&
                      userStatus[data[index].id.toString()] == true
                  ? theme.primaryColor
                  : theme.primaryColorDark,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                                data[index].firstName +
                                    " " +
                                    data[index].lastName1,
                                style: Theme.of(context).textTheme.titleSmall),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}