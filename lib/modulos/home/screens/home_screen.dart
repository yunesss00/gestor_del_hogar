import 'package:flutter/material.dart';
import 'package:gestor_del_hogar/modulos/home/screens/home_controller.dart';
import 'package:gestor_del_hogar/presentation/shared/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  static const name = 'home';


  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();


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
      drawer: SideMenu(scaffoldKey: scaffoldKey),
    );
  }
}

_createHome(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: SizedBox(height: 1000, child: _CreateHomeForm()),
        );
      });
}

class _CreateHomeForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final HomeController homeController = HomeController();
    final TextEditingController controllerName = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Form(
        key: _formKey,
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
                  controller: controllerName,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Campo obligatorio";
                    }
                  }
            )),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: CustomFilledButton(
                text: 'Crear',
                onPressed: () {
                  homeController.create(controllerName.text);

                  //context.push('/my-home-screen');
                },
                buttonColor: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
