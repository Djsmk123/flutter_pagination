import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_in_flutter/models/product_model.dart';
import 'package:pagination_in_flutter/presentation/blocs/products_bloc.dart';

/*
The PaginationWidget<t> class is a Flutter stateless widget that renders a list of items with pagination support. It takes in several parameters through its constructor to configure its behavior and appearance.

The constructor for the PaginationWidget<t> class has the following parameters:

    loadMore: a function that is called when the user reaches the end of the list and needs to load more items.
    initialError: a widget to display when an error occurs while loading the initial list of items.
    initialLoading: a widget to display while the initial list of items is being loaded.
    initialEmpty: a widget to display when the initial list of items is empty.
    child: a function that takes an item of type t and returns a widget that represents that item in the list.
    onLoadMoreError: a widget to display when an error occurs while loading more items.
    onLoadMoreLoading: a widget to display while more items are being loaded.
    key: a unique identifier for the widget.

The build method of the PaginationWidget<t> class returns a BlocBuilder widget that listens to the state changes of a ProductsBloc. Based on the current state of the ProductsBloc, the widget will render the appropriate UI components.

If the state is ProductsLoaded, the widget will render a ListView with the items returned by the bloc's products property. The NotificationListener will listen for the end of the list and trigger the loadMore function to load more items if necessary. If an error occurs while loading more items, the onLoadMoreError widget will be displayed. If more items are currently being loaded, the onLoadMoreLoading widget will be displayed.

If the state is ProductsInitialLoading, the initialLoading widget will be displayed.

If the state is ProductsEmpty, the initialEmpty widget will be displayed.

If the state is ProductInitialError, the initialError widget will be displayed.

If none of the above states match the current state of the ProductsBloc, an empty SizedBox will be displayed.

The child function is called for each item in the list to render the appropriate UI components for that item. The type of the item is specified as t in the constructor of the PaginationWidget<t> class.

 */
class PaginationWidget<t> extends StatelessWidget {
  final Function() loadMore;
  final Widget initialError;
  final Widget initialLoading;
  final Widget initialEmpty;
  final Widget Function(t p) child;
  final Widget? onLoadMoreError;
  final Widget? onLoadMoreLoading;
  const PaginationWidget(
      {Key? key,
      required this.loadMore,
      required this.initialError,
      required this.initialLoading,
      required this.initialEmpty,
      this.onLoadMoreError,
      this.onLoadMoreLoading,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoaded) {
          List<ProductModel> products = state.products.products;
          return NotificationListener<ScrollEndNotification>(
              onNotification: (scrollInfo) {
                scrollInfo.metrics.pixels ==
                            scrollInfo.metrics.maxScrollExtent &&
                        !state.products.reachMax
                    ? loadMore()
                    : null;
                return true;
              },
              child: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: products.length,
                          itemBuilder: (context, index) =>
                              child(products[index] as t))),
                  const SizedBox(
                    height: 20,
                  ),
                  //if error occured while loading more
                  if (state.error != null)
                    Expanded(child: onLoadMoreError ?? initialError),
                  if (state.loading != null)
                    Expanded(child: onLoadMoreLoading ?? initialLoading),
                ],
              ));
        }
        if (state is ProductsInitialLoading) {
          return initialLoading;
        }
        if (state is ProductsEmpty) {
          return initialEmpty;
        }
        if (state is ProductInitialError) {
          return initialError;
        }
        return const SizedBox.shrink();
      },
    );
  }
}
