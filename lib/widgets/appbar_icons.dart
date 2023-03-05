import 'package:flutter/material.dart';

class AppbarIcons extends StatelessWidget {
  const AppbarIcons({super.key, required this.function, required this.icons});

  final void Function() function;
  final IconData icons;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          function;
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).cardColor,
          ),
          padding:const EdgeInsets.all(6),
          child:  Icon(icons),
        ),
      ),
    );
  }
}
