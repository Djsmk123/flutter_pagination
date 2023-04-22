import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_in_flutter/presentation/blocs/products_bloc.dart';
import 'package:pagination_in_flutter/presentation/pages/products_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => ProductsBloc())],
        child: MaterialApp(
          title: 'Pagination Example with Flutter',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: true),
          home: const ProductsPage(),
        ));
  }
}
