import 'package:flutter/material.dart';

class CustomListenableWidget<T> extends ValueListenableBuilder<T> {
  const CustomListenableWidget({super.key, required super.valueListenable, required super.builder});
}