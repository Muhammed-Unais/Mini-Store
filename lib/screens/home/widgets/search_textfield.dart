import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:mini_store/constants/global_colors.dart';

class SearchTextfield extends StatelessWidget {
  const SearchTextfield({
    super.key,
    required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: "Search",
        filled: true,
        fillColor: lightCardColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
          borderSide: BorderSide(
            color: Theme.of(context).cardColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
          borderSide: BorderSide(
            color: Theme.of(
              context,
            ).colorScheme.secondary,
          ),
        ),
        suffixIcon: Icon(
          IconlyLight.search,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}