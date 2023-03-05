import 'package:flutter/material.dart';
import 'package:mini_store/constants/global_colors.dart';

class ProductNameAndPrice extends StatelessWidget {
  const ProductNameAndPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Flexible(
          flex: 3,
          child: Text(
            "Lorem ipsum",
            textAlign: TextAlign.start,
            style: TextStyle(
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
                  text: "168.00",
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