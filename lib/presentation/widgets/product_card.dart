import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pagination_in_flutter/colors.dart';
import 'package:pagination_in_flutter/model/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Card(
        elevation: 5,
        surfaceTintColor: primaryColor,
        color: Colors.blueAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Stack(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.white,
                          child: ClipOval(
                            child: CachedNetworkImage(
                              width: double.maxFinite,
                              height: 130.0,
                              fit: BoxFit.scaleDown,
                              imageUrl: product.image,
                              placeholder: (context, url) => const SizedBox(
                                width: 10,
                                height: 10,
                              ),
                              errorWidget: (context, url, error) => Image.asset(
                                'assets/images/sinimagen.png',
                                height: 30,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Flexible(
                          child: Text(
                        product.title,
                        maxLines: 2,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        product.rating.count.toString(),
                        maxLines: 2,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 125,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: primaryColor),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(product.price.toString()),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(Icons.shopping_cart_outlined),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
