import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:mini_store/constants/global_colors.dart';
import 'package:mini_store/models/product_model.dart';
import 'package:mini_store/screens/product_details/widgets/product_discription.dart';
import 'package:mini_store/screens/product_details/widgets/product_nameand_price.dart';
import 'package:mini_store/screens/product_details/widgets/product_pagination.dart';
import 'package:mini_store/services/api_handler.dart';
import 'package:mini_store/widgets/appbar_icons.dart';

class ProductDeatilsScreen extends StatefulWidget {
  const ProductDeatilsScreen({super.key, required this.productmodel});

  final ProductModel productmodel;

  @override
  State<ProductDeatilsScreen> createState() => _ProductDeatilsScreenState();
}

class _ProductDeatilsScreenState extends State<ProductDeatilsScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getsingleProduct();
  }

  String errorStr = "";
  bool isError = false;
  ProductModel? productModels;
  void getsingleProduct() async {
    try {
      productModels = await ApiHandler.getAllProductDetails(
          id: widget.productmodel.id.toString());
      if (mounted) {}
    } catch (error) {
      isError = true;
      log("error ocurred");
      errorStr = error.toString();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: isError == true
          ? Center(
              child: Text(errorStr),
            )
          : productModels == null
              ? Center(
                  child: CircularProgressIndicator(
                    color: lightIconsColor,
                  ),
                )
              : SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(
                          height: 18,
                        ),
// Back arrow icon==============================
                        AppbarIcons(
                          function: () {
                            Navigator.pop(context);
                          },
                          icons: IconlyBold.arrow_left_circle,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(
                            8.0,
                          ),
// Column used for catogery and priduct name and details==
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                productModels!.category!.name!,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 18,
                              ),
// Product Name and Price========================
                              ProductNameAndPrice(productModel: productModels!),
                              const SizedBox(
                                height: 18,
                              ),
                            ],
                          ),
                        ),
// Product Pagination images======================
                        PaginationProductImages(
                            size: size, productModel: productModels!),
                        const SizedBox(
                          height: 18,
                        ),
// Product Dicsription============================
                        ProductDescrption(productModel: productModels!),
                      ],
                    ),
                  ),
                ),
    );
  }
}
