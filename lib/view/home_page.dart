import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siddharth/bloc/fetch_product_event.dart';
import 'package:siddharth/bloc/product_cubit.dart';
import 'package:siddharth/bloc/product_detail_bloc.dart';
import 'package:siddharth/common/bloc/common_state.dart';
import 'package:siddharth/view/product_detail_page.dart';
import '../models/product_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProductCubit, CommonState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CommonErrorState) {
            return Center(child: Text(state.message));
          } else if (state is CommonSuccessState<List<Make>>) {
            return ListView.separated(
              itemCount: state.item.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    context
                        .read<FetchProductDetailBloc>()
                        .add(FetchProductEvent(makeId: state.item[index].id));
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) =>  ProductDetailPage(makeId: state.item[index].id)));
                  },
                  child: Container(
                    color: Colors.blue.shade300,
                    height: 200,
                    width: 300,
                    child: Column(
                      children: [
                        Text(state.item[index].id.toString()),
                        Text(state.item[index].title),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: ((context, index) {
                return const SizedBox(height: 10);
              }),
            );
          } else {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
        },
      ),
    );
  }
}
