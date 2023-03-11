import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:mini_store/constants/global_colors.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:mini_store/models/product_model.dart';
import 'package:provider/provider.dart';

class FeedWidget extends StatelessWidget {
  const FeedWidget({
    super.key,
    required this.feedAction,
  });

  final void Function() feedAction;
  // final List imageurl;
  // final String title;
  // final int price;

  @override
  Widget build(BuildContext context) {
    final ProductModel productModel = Provider.of<ProductModel>(context);
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).cardColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: feedAction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 5,
                  right: 5,
                  top: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                          text: "\$",
                          style: const TextStyle(
                            color: Color.fromRGBO(
                              33,
                              150,
                              243,
                              1,
                            ),
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: productModel.price.toString(),
                              style: TextStyle(
                                color: lightTextColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Icon(
                      IconlyBold.heart,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FancyShimmerImage(
                  imageUrl: productModel.images![0],
                  height: size.height * 0.2,
                  width: double.infinity,
                  boxFit: BoxFit.cover,
                  errorWidget: Image.asset(
                    "assets/images/—Pngtree—casual shoes_5640199.png",
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    productModel.title!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
