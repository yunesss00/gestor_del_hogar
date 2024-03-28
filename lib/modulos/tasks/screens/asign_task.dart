import 'package:flutter/material.dart';
import 'package:gestor_del_hogar/core/states_managment/custom_listenable_widget.dart';
import 'package:gestor_del_hogar/domain/entities/assigned_task.dart';
import 'package:gestor_del_hogar/domain/entities/task.dart';
import 'package:gestor_del_hogar/domain/entities/user_entity.dart';
import 'package:gestor_del_hogar/modulos/home/controller/home_controller.dart';
import 'package:gestor_del_hogar/modulos/home/screens/my_home_screen.dart';
import 'package:gestor_del_hogar/modulos/tasks/controller/datepicker_controller.dart';
import 'package:gestor_del_hogar/modulos/tasks/screens/tasks_screen.dart';
import 'package:gestor_del_hogar/presentation/shared/widgets/custom_filled_button.dart';
import 'package:gestor_del_hogar/presentation/shared/widgets/generic_user_pulsable_card.dart';
import '../../../core/states_managment/state_manager.dart';

class AsignTaskScreen extends StatelessWidget {
  final homeController = StateManager.getInstance().get<HomeController>();
  final DatePickerController datePickerController = DatePickerController();

  final Task task;
  AsignTaskScreen({super.key, required this.task});

  final DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    homeController.getAllParticipants();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
                child: Text(
              'Editar tarea',
              style: Theme.of(context).textTheme.titleMedium,
            )),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0),
                child: Text(
                  'Participantes',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 20),
            CustomListenableWidget(
              valueListenable: homeController.participantsList,
              builder: (context, users, child) {
                return SizedBox(
                  height: 200, // Define una altura para el ListView
                  child: ListView.builder(
                    itemCount: users?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return userList(context, users!, index);
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            _datePicker(context),
            ElevatedButton(
              onPressed: () {
                _save();
              },
              child: Text('Guardar'),
            )
          ],
        ),
      ),
    );
  }

  Widget userList(BuildContext context, List<UserEntity> users, int index) {
    return GenericUserPulsableCard(users: users);
  }

  _datePicker(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.0),
            child: Text(
              'Fecha de la tarea',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Row(
            children: [
              CustomListenableWidget(
                valueListenable: datePickerController.selectedDate,
                builder: (context, value, child) {
                  return OutlinedButton(
                    child: value == null
                        ? const Text('Seleccionar fecha')
                        : Text(
                            'Fecha seleccionada: ${value.day}/${value.month}/${value.year}'),
                    onPressed: () async {
                      final dateTime = await showDatePicker(
                        context: context,
                        initialDate:
                            selectedDate, // Update the initialDate value
                        firstDate: DateTime.now(),
                        lastDate:
                            DateTime.now().add(const Duration(days: 5000)),
                      );
                      if (dateTime != null) {
                        datePickerController.setSelectedDate(dateTime);
                      }
                    },
                  );
                },
              ),
              const SizedBox(width: 50),
            ],
          ),
        ),
      ],
    );
  }

  _save() {
    taskController.assignTask(task, datePickerController.selectedDate.value);
  }
}
