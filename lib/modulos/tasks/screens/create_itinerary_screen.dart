import 'package:flutter/material.dart';
import 'create_itinerary_form.dart';

class CreateItineraryScreen extends StatelessWidget {
  const CreateItineraryScreen({super.key});

  static const name = 'create-itinerary';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Crear Itinerario'),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: const CreateItineraryForm(),
          ),
        ));
  }



}

