// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:siddharth/bloc/fetch_product_event.dart';
// import 'package:siddharth/common/bloc/common_state.dart';
// import '../bloc/product_detail_bloc.dart';
// import '../models/product_detail.dart';

// class ProductDetailPage extends StatefulWidget {
//   const ProductDetailPage({super.key});

//   @override
//   State<ProductDetailPage> createState() => _ProductDetailPageState();
// }

// class _ProductDetailPageState extends State<ProductDetailPage> {
//   final ScrollController _scrollController = ScrollController();

//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(_onScroll);
//   }

//   @override
//   void dispose() {
//     _scrollController.removeListener(_onScroll);
//     _scrollController.dispose();
//     super.dispose();
//   }

//   void _onScroll() {
//     if (_scrollController.position.pixels ==
//             _scrollController.position.maxScrollExtent &&
//         _scrollController.position.userScrollDirection ==
//             ScrollDirection.reverse) {
//       context.read<FetchProductDetailBloc>().add(LoadMoreProductEvent());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Detail Page'),
//       ),
//       body: BlocConsumer<FetchProductDetailBloc, CommonState>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           if (state is CommonErrorState) {
//             return Center(child: Text(state.message));
//           } else if (state is CommonLoadingState) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is CommonSuccessState<List<Datum>>) {
//             return ListView.separated(
//               controller: _scrollController,
//               itemCount: state.item.length,
//               itemBuilder: (context, index) {
//                 return Container(
//                   height: 150,
//                   width: 200,
//                   color: Colors.yellow.shade300,
//                   child: Column(
//                     children: [
//                       Text(state.item[index].id.toString()),
//                       Text(state.item[index].title.toString()),
//                     ],
//                   ),
//                 );
//               },
//               separatorBuilder: (context, index) {
//                 return const SizedBox(height: 10);
//               },
//             );
//           }

//           return const SizedBox();
//         },
//       ),
//     );
//   }
// }
