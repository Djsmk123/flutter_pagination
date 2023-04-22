import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_in_flutter/models/product_list_model.dart';
import 'package:pagination_in_flutter/repo/products_repo.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsListModel products = const ProductsListModel(
    products: [],
    currentPage: 1,
    reachMax: false,
  );
  ProductsBloc() : super(ProductsInitial()) {
    on<ProductsEvent>((event, emit) async {
      if (event is ProductsLoadEvent) {
        bool isInitial = products.currentPage == 1;
        isInitial
            ? emit(ProductsInitialLoading(message: 'Fetching products....'))
            : emit(ProductsLoaded(
                products: products,
                loading: LoadingMore(message: 'Fetching more products...')));
        final response =
            await ProductRepo.getProducts(page: products.currentPage);
        response.fold(
            (l) => isInitial
                ? emit(ProductInitialError(message: 'Failed to load products'))
                : emit(ProductsLoaded(
                    products: products,
                    error: LoadMoreError(
                        message: 'Failed to load more products'))), (r) {
          if (isInitial) {
            products = ProductsListModel(
                products: r.products,
                currentPage: r.currentPage + 1,
                reachMax: r.reachMax);

            if (products.products.isEmpty) {
              emit(ProductsEmpty());
            }
          } else {
            //Adding products to existing list
            products = ProductsListModel(
                products: products.products + r.products,
                currentPage: r.currentPage + 1,
                reachMax: r.reachMax);
          }
          emit(ProductsLoaded(products: products));
        });
      }
    });
  }
}
