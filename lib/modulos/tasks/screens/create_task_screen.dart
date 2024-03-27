import 'package:flutter/material.dart';
import 'package:gestor_del_hogar/domain/entities/assigned_task.dart';
import 'package:gestor_del_hogar/domain/entities/task.dart';
import 'package:go_router/go_router.dart';

import '../../../presentation/shared/widgets/custom_filled_button.dart';
import '../../../presentation/shared/widgets/custom_text_form_field.dart';
import '../controller/task_controller.dart';

class CreateTaskScreen extends StatelessWidget {
  const CreateTaskScreen({super.key});

  static const name = 'create-task';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: size.height < 700 ? true : false,
        appBar: AppBar(
          title: const Text('Crear Tarea'),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: const _CreateTaskForm(),
          ),
        ));
  }
}

class _CreateTaskForm extends StatelessWidget {
  const _CreateTaskForm();
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TaskController taskController = TaskController();
    final TextEditingController controllerName = TextEditingController();
    final TextEditingController controllerDescription = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
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
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: CustomFilledButton(
                  text: 'Crear',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      Task task_ = Task(
                        name: controllerName.text,
                        description: controllerDescription.text,
                      );
                      if (await taskController.createTask(task_)) {
                        GoRouter.of(context).pop();
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
