import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CachedNetworkImage(
            imageUrl: "https://gcdnb.pbrd.co/images/5Rz9dEYkdYdm.png?o=1",
            height: 200,
          ),
          const SizedBox(
            height: 30,
          ),
          Text("Error Occured,try again",
              style: TextStyle(color: Colors.grey.shade500, fontSize: 24)),
        ],
      ),
    );
  }
}
