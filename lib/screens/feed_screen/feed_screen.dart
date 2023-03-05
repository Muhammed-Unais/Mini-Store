import 'package:flutter/material.dart';
import 'package:mini_store/screens/home/widgets/feed_widget.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "All Produts",
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        shrinkWrap: true,
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 0.0,
          mainAxisSpacing: 0.0,
          childAspectRatio: 1 / 1.4,
        ),
        itemBuilder: (context, index) {
          return SizedBox(
            width: size.width * 0.4,
            child: FeedWidget(
              feedAction: () {},
            ),
          );
        },
      ),
    );
  }
}
