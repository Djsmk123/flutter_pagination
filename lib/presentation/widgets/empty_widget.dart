import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CachedNetworkImage(
            imageUrl:
                "https://static.vecteezy.com/system/resources/previews/005/073/073/original/no-item-in-the-shopping-cart-add-product-click-to-shop-now-concept-illustration-flat-design-eps10-modern-graphic-element-for-landing-page-empty-state-ui-infographic-icon-vector.jpg",
            height: 200,
          ),
          const SizedBox(
            height: 30,
          ),
          Text("No products available",
              style: TextStyle(color: Colors.grey.shade500, fontSize: 24)),
        ],
      ),
    );
  }
}
