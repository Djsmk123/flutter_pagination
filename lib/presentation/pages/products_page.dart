import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_in_flutter/colors.dart';
import 'package:pagination_in_flutter/models/product_model.dart';
import 'package:pagination_in_flutter/presentation/blocs/products_bloc.dart';

import '../widgets/widgets.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  void initState() {
    BlocProvider.of<ProductsBloc>(context).add(ProductsLoadEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.menu,
            color: primaryColor,
            size: 30,
          ),
          title: Text(
            "Flutter Pagination",
            style: TextStyle(
              color: primaryColor,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
        ),
        body: PaginationWidget<ProductModel>(
          loadMore: () {
            BlocProvider.of<ProductsBloc>(context).add(ProductsLoadEvent());
          },
          initialEmpty: const EmptyWidget(),
          initialLoading: const LoadingWidget(),
          initialError: const CustomErrorWidget(),
          child: (ProductModel productModel) {
            return ProductCard(product: productModel);
          },
        ));
  }
}
