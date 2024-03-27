import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gestor_del_hogar/core/states_managment/custom_listenable_widget.dart';
import 'package:gestor_del_hogar/domain/entities/task.dart';
import 'package:gestor_del_hogar/domain/entities/user_entity.dart';
import 'package:gestor_del_hogar/modulos/home/controller/home_controller.dart';
import 'package:gestor_del_hogar/presentation/shared/widgets/generic_user_pulsable_card.dart';
import '../../../core/states_managment/state_manager.dart';




class AsignTaskScreen extends StatelessWidget {
    final homeController = StateManager.getInstance().get<HomeController>();

  final Task task;
  AsignTaskScreen({super.key, required this.task});

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
                  style:  TextStyle(fontSize: 16),
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
          ],
        ),
      ),
    );
  }

  Widget userList(BuildContext context, List<UserEntity> users, int index) {
    return GenericUserPulsableCard(users: users);
  }

}

_datePicker(BuildContext context) {
  return Container(
    height: 50,
    width: 200,
    child: ElevatedButton(
      onPressed: () {
        showDatePicker(
          context: context,
            initialDate: DateTime.now(), // Update the initialDate value
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(Duration(days: 5000)),
        );
      },
      child: const Text('Seleccionar fecha'),
    ),
  );
}
