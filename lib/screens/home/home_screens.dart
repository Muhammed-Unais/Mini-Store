import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:mini_store/constants/global_colors.dart';
import 'package:mini_store/screens/home/widgets/appbar.dart';
import 'package:mini_store/screens/home/widgets/carsoule_widget.dart';
import 'package:mini_store/screens/home/widgets/search_textfield.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
// Home Appbar============================
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(
            56,
          ),
          child: HomeAppbar(),
        ),
// Home body==============================
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 18,
              ),
// Search Textfield=======================
              SearchTextfield(
                textEditingController: textEditingController,
              ),
              const SizedBox(
                height: 18,
              ),
// Carsoule Widget=======================
              SizedBox(
                height: size.height * 0.21,
                child: Swiper(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return const CarsouleWidget();
                  },
                  pagination:  SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                      color: Colors.white,
                      activeColor: lightIconsColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
