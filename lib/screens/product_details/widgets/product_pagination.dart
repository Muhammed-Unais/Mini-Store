import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:mini_store/constants/global_colors.dart';

class PaginationProductImages extends StatelessWidget {
  const PaginationProductImages({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.32,
      child: Swiper(
        autoplay: false,
        itemCount: 4,
        itemBuilder: (context, index) {
          return FancyShimmerImage(
            imageUrl:
                "https://png.pngtree.com/png-clipart/20201209/original/pngtree-casual-shoes-png-image_5640199.jpg",
            width: double.infinity,
            boxFit: BoxFit.contain,
          );
        },
        pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            color: Colors.white,
            activeColor: lightIconsColor,
          ),
        ),
      ),
    );
  }
}