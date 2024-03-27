import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gestor_del_hogar/domain/entities/itinerary.dart';
import 'package:gestor_del_hogar/presentation/shared/widgets/weekDay_card.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

import '../../../core/states_managment/state_manager.dart';
import '../../../domain/entities/task.dart';
import '../../../presentation/shared/widgets/custom_filled_button.dart';
import '../../../presentation/shared/widgets/custom_text_form_field.dart';
import '../../../presentation/shared/widgets/generic_card.dart';
import '../../../presentation/shared/widgets/generic_pulsable_card.dart';
import '../controller/task_controller.dart';

final TaskController taskController = TaskController();

class CreateItineraryForm extends StatelessWidget {
  static List<Task> lstTasks = [];

  const CreateItineraryForm({super.key, lstTasks});

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController controllerName = TextEditingController();
    final TextEditingController controllerDescription = TextEditingController();
    late Itinerary itinerary = const Itinerary();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 10),
              Text('Datos básicos',
                  style: Theme.of(context).textTheme.titleSmall),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomTextFormField(
                    label: 'Nombre',
                    controller: controllerName,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese un nombre';
                      }
                      if (value.length < 3) {
                        return 'El nombre debe tener al menos 3 caracteres';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomTextFormField(
                    label: 'Descripción',
                    controller: controllerDescription,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese una descripción';
                      }
                      if (value.length < 5) {
                        return 'La descripción debe tener al menos 5 caracteres';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text('Asignación de tareas',
                  style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 20),
              TaskListContainer(),
              const SizedBox(height: 20),
              CustomFilledButton(
                text: 'Crear',
                onPressed: () async {

                  /*  if (_formKey.currentState!.validate()) {
                    itinerary = itinerary.copyWith(
                        name: controllerName.text,
                        description: controllerDescription.text,
                        tasks: SelectedTasksController().value);
                    final res = await taskController.createItinerary(itinerary);
                    if (res) {
                      Navigator.pop(context);
                    } else {
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Error al crear el itinerario'),
                        ),
                      );
                    }
                  }*/
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class TaskListContainer extends StatefulWidget {
  @override
  _TaskListContainerState createState() => _TaskListContainerState();
}

class _TaskListContainerState extends State<TaskListContainer> {
  @override
  Widget build(BuildContext context) {
    return GenericPulsableCard(
     // controller: SelectedTasksController(), 
      dayOfWeek: 0,
    );
  }
}
/*
_asignTask(
    BuildContext context, int index, SelectedTasksController controller) {
  final size = MediaQuery.of(context).size;

  // ignore: use_build_context_synchronously
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
            height: size.height - 180, // 80 los dos sizebox y 100 el ícono
            width: double.infinity,
            child: GenericPulsableCard(
              controller: controller,
              dayOfWeek: index,
            ),
          ),
        ),
      );
    },
  );
}^*/
