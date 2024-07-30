import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siddharth/bloc/product_cubit.dart';
import 'package:siddharth/bloc/product_detail_bloc.dart';
import 'package:siddharth/repo/product_repo.dart';
import 'package:siddharth/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ProductRepository(),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ProductCubit(productRepository: context.read<ProductRepository>())..fetchProducts(),
            ),
            BlocProvider(
              create: (context) => FetchProductDetailBloc(repository: context.read<ProductRepository>()),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const HomePage(),
          ),
        ),
    );
  }
}
