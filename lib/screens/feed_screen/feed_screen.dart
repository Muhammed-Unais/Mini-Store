import 'package:flutter/material.dart';
import 'package:mini_store/constants/global_colors.dart';
import 'package:mini_store/models/product_model.dart';
import 'package:mini_store/screens/home/widgets/feed_widget.dart';
import 'package:mini_store/screens/product_details/product_details.dart';
import 'package:mini_store/services/api_handler.dart';
import 'package:provider/provider.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({
    super.key,
  });

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  ScrollController scrollControler = ScrollController();
  List<ProductModel> productList = [];
  int limit = 10;
  bool islimit = false;

  @override
  void initState() {
    getAlldata();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    scrollControler.addListener(
      () async {
        if (limit == 200) {
          islimit = true;
          if(mounted){
            setState(() {});
          }
          return;
        }
        if (scrollControler.position.pixels ==
            scrollControler.position.maxScrollExtent) {
          limit += 10;
          await getAlldata();
        }
      },
    );
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    scrollControler.dispose();
    super.dispose();
  }

  Future getAlldata() async {
    productList = await ApiHandler.getProduct(limit.toString());
    if (mounted) {
      setState(() {});
    }
  }

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
      body: SingleChildScrollView(
        controller: scrollControler,
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: productList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0.0,
                mainAxisSpacing: 0.0,
                childAspectRatio: 1 / 1.4,
              ),
              itemBuilder: (context, index) {
                return productList.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : SizedBox(
                        width: size.width * 0.4,
                        child: ChangeNotifierProvider.value(
                          value: productList[index],
                          child: FeedWidget(
                            feedAction: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ProductDeatilsScreen(
                                      productmodel: productList[index],
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      );
              },
            ),
            if (!islimit)
              Center(
                child: CircularProgressIndicator(
                  color: lightIconsColor,
                  strokeWidth: 2,
                ),
              )
          ],
        ),
      ),
    );
  }
}
