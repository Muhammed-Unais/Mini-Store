import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:mini_store/screens/product_details/widgets/product_discription.dart';
import 'package:mini_store/screens/product_details/widgets/product_nameand_price.dart';
import 'package:mini_store/screens/product_details/widgets/product_pagination.dart';
import 'package:mini_store/widgets/appbar_icons.dart';

class ProductDeatilsScreen extends StatelessWidget {
  const ProductDeatilsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
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
                  children: const [
                    Text(
                      "Category",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
// Product Name and Price========================
                    ProductNameAndPrice(),
                    SizedBox(
                      height: 18,
                    ),
                  ],
                ),
              ),
// Product Pagination images======================
              PaginationProductImages(size: size),
              const SizedBox(
                height: 18,
              ),
// Product Dicsription============================              
              const ProductDescrption(),
            ],
          ),
        ),
      ),
    );
  }
}


