import 'package:flutter/material.dart';

class CustomMultiListenableWidget extends AnimatedBuilder {
  CustomMultiListenableWidget({Key? key, required List<ValueNotifier> valueListenable, required TransitionBuilder builder, Widget? child}) : super(key: key, animation: Listenable.merge(valueListenable), builder: builder, child: child);
}