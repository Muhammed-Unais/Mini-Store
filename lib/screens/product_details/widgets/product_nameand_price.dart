import 'package:flutter/material.dart';
import 'package:mini_store/constants/global_colors.dart';
import 'package:mini_store/models/product_model.dart';

class ProductNameAndPrice extends StatelessWidget {
  const ProductNameAndPrice({
    super.key, required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Flexible(
          flex: 3,
          child: Text(
            productModel.title!,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 28,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: RichText(
            text: TextSpan(
              text: "\$",
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(33, 150, 243, 1),
              ),
              children: <TextSpan>[
                TextSpan(
                  text: productModel.price.toString(),
                  style: TextStyle(
                    color: lightTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
