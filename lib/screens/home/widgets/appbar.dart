import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:mini_store/widgets/appbar_icons.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "Home",
      ),
      leading: AppbarIcons(
        function: () {},
        icons: IconlyBold.category,
      ),
      actions: [
        AppbarIcons(
          function: () {},
          icons: IconlyBold.user_3,
        ),
      ],
    );
  }
}