import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestor_del_hogar/presentation/shared/widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:gestor_del_hogar/presentation/providers/providers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const name = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Home', style: Theme.of(context).textTheme.titleMedium),
          centerTitle: true),
      body: Center(
          child: Text('Entra a un hogar o crea el tuyo propio',
              style: Theme.of(context).textTheme.bodyLarge)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _createHome(context);
        },
        tooltip: 'Crear hogar',
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}


_createHome(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: SizedBox(
            height: 1000,
            child: _CreateHomeForm()
          ),
        );
      });
}

class _CreateHomeForm extends ConsumerWidget {
  const _CreateHomeForm();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createHomeForm = ref.watch(createHomeFormProvider);

    return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Column(
                children: <Widget>[
                  Center(
                    child: Text(
                      'Crear hogar',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  const SizedBox(height: 70),
                  Center(
                      child: CustomTextFormField(
                    label: 'Nombre hogar',
                    onChanged: (value) => 
                        ref.read(createHomeFormProvider.notifier).onHomeNameChanged(value),
                    errorMessage: createHomeForm.isFormPosted
                        ? createHomeForm.name.errorMessage
                        : null,
                  )),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: CustomFilledButton(
                      text: 'Crear',
                      onPressed: () => ref.read(createHomeFormProvider.notifier).onFormSubmit(),
                      buttonColor: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            );
  }
}


