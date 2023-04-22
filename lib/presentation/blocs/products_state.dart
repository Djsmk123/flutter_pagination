part of 'products_bloc.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

//State for initial Loading when current page will be 1
class ProductsInitialLoading extends ProductsState {
  final String message;
  ProductsInitialLoading({required this.message});
}

class ProductInitialError extends ProductsState {
  final String message;
  ProductInitialError({required this.message});
}

class ProductsEmpty extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final ProductsListModel products;
  final LoadingMore? loading;
  final LoadMoreError? error;
  ProductsLoaded({
    required this.products,
    this.loading,
    this.error,
  });
}

class LoadingMore {
  final String message;
  LoadingMore({required this.message});
}

class LoadMoreError {
  final String message;
  LoadMoreError({required this.message});
}
