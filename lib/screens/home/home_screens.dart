import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:mini_store/constants/global_colors.dart';
import 'package:mini_store/models/product_model.dart';
import 'package:mini_store/screens/feed_screen/feed_screen.dart';
import 'package:mini_store/screens/home/widgets/appbar.dart';
import 'package:mini_store/screens/home/widgets/carsoule_widget.dart';
import 'package:mini_store/screens/home/widgets/search_textfield.dart';
import 'package:mini_store/screens/home/widgets/titiles_and_viewmore.dart';
import 'package:mini_store/screens/product_details/product_details.dart';
import 'package:mini_store/services/api_handler.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'widgets/feed_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController textEditingController;
  // List<ProductModel> productList = [];
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
// Home body Started======================
        body: Padding(
          padding: const EdgeInsets.all(
            8.0,
          ),
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
// Carsoule Widget Builder================
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.21,
                        child: Swiper(
                          autoplay: true,
                          itemCount: 3,
                          itemBuilder: (
                            context,
                            index,
                          ) {
                            return const CarsouleWidget();
                          },
                          pagination: SwiperPagination(
                            builder: DotSwiperPaginationBuilder(
                              color: Colors.white,
                              activeColor: lightIconsColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
// feed page widget=======================
                      TitlsAndViewmore(
                        allProducuNavAct: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: const FeedScreen(),
                            ),
                          );
                        },
                      ),
                      FutureBuilder<List<ProductModel>>(
                        future: ApiHandler.getProduct("10"),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.black,
                                strokeWidth: 2,
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                "${snapshot.error}",
                                style: const TextStyle(color: Colors.black),
                              ),
                            );
                          } else if (snapshot.data == null) {
                            return Center(
                              child: Text("${snapshot.error}"),
                            );
                          }
                          return GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data!.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 0.0,
                              mainAxisSpacing: 0.0,
                              childAspectRatio: 1 / 1.4,
                            ),
                            itemBuilder: (context, index) {
                              return SizedBox(
                                width: size.width * 0.4,
                                child: ChangeNotifierProvider.value(
                                  value: snapshot.data![index],
                                  child: FeedWidget(
                                    feedAction: () {
                                      Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.fade,
                                          child: ProductDeatilsScreen(
                                          productmodel: snapshot.data![index],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
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
