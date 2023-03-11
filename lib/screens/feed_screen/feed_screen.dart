import 'package:flutter/material.dart';
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
  List<ProductModel> productList = [];
  @override
  void didChangeDependencies() {
    getAlldata();
    super.didChangeDependencies();
  }

  Future getAlldata() async {
    productList = await ApiHandler.getProduct();
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
      body: GridView.builder(
        shrinkWrap: true,
        itemCount: productList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 0.0,
          mainAxisSpacing: 0.0,
          childAspectRatio: 1 / 1.4,
        ),
        itemBuilder: (context, index) {
          return productList.isEmpty
              ? const Center(child: CircularProgressIndicator())
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
                              return ProductDeatilsScreen(productmodel: productList[index],);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                );
        },
      ),
    );
  }
}
