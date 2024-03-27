

import 'package:flutter/material.dart';

import '../../../domain/entities/itinerary.dart';
import '../../../domain/entities/task.dart';
import '../../../presentation/shared/widgets/custom_filled_button.dart';
import '../../../presentation/shared/widgets/custom_text_form_field.dart';
import '../../../presentation/shared/widgets/generic_card.dart';
import '../controller/task_controller.dart';

class EditTaskForm extends StatelessWidget {
  final Task task; // Agrega el argumento de la clase Task

  const EditTaskForm({required this.task}); // Actualiza el constructor

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TaskController taskController = TaskController();
    final TextEditingController controllerName = TextEditingController();
    final TextEditingController controllerDescription = TextEditingController();

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Center(
                child: Text(
                  'Editar tarea',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              const SizedBox(height: 70),
              Center(
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
                    if (value == task.name) {
                      return 'El nombre no puede ser el mismo';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 70),
              Center(
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
                    if (value == task.description) {
                      return 'La descripción no puede ser la misma';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: CustomFilledButton(
                  text: 'Editar',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      taskController.updateTask(
                        task.id!,
                        controllerName.text,
                        controllerDescription.text,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
    );
  }
}

Widget itineraryList(
    BuildContext context, int index, List<Itinerary>? itineraries) {
  final ThemeData theme = Theme.of(context);

  return GenericCard(
    name: itineraries![index].name!,
    description: itineraries[index].description!,
    icon1: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.supervisor_account_outlined),
        color: theme.primaryColor),
    icon2: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.more_vert),
        color: theme.primaryColor),
  );
}
