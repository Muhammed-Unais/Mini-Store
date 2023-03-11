import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:mini_store/screens/catagory/catagory_screen.dart';
import 'package:mini_store/screens/user_screen/user_screen.dart';
import 'package:mini_store/widgets/appbar_icons.dart';
import 'package:page_transition/page_transition.dart';

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
        function: () {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: const CatagoryScreen(),
            ),
          );
        },
        icons: IconlyBold.category,
      ),
      actions: [
        AppbarIcons(
          function: () {
            Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: const UserScreen(),
            ),
          );
          },
          icons: IconlyBold.user_3,
        ),
      ],
    );
  }
}
