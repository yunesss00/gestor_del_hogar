import 'package:flutter/material.dart';

class GenericCard extends StatelessWidget {
  final String name;
  final IconButton icon1;
  final IconButton? icon2;

  const GenericCard({
    Key? key,
    required this.name,
    required this.icon1,
    this.icon2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            icon1,
            const SizedBox(width: 8),
            if (icon2 != null) icon2!,
          ],
        ),
      ),
    );
  }
}
