import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siddharth/bloc/fetch_product_event.dart';
import 'package:siddharth/common/bloc/common_state.dart';
import '../bloc/product_detail_bloc.dart';
import '../models/product_detail.dart';

class ProductDetailPage extends StatefulWidget {
  int makeId;
  ProductDetailPage({super.key, required this.makeId});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final ScrollController _scrollController = ScrollController();
  List<Data> _allItems = []; // Keep track of all items

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Check if we're at the end of the list and scrolling down
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        _scrollController.position.userScrollDirection ==
            ScrollDirection.reverse) {
      context
          .read<FetchProductDetailBloc>()
          .add(LoadMoreProductEvent(makeId: widget.makeId));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: BlocConsumer<FetchProductDetailBloc, CommonState>(
        listener: (context, state) {
          if (state is CommonSuccessState<List<Data>>) {
            final newItems = state.item;
            final previousItemCount = _allItems.length;

            // Update all items
            _allItems = newItems;

            // Calculate the new items loaded
            final newItemsCount = _allItems.length - previousItemCount;

            if (newItemsCount > 0) {
              // Calculate the height of the new items to adjust the scroll
              final newItemsHeight = (150.0 + 10.0) * newItemsCount;

              // Post a frame callback to ensure UI update has occurred
              WidgetsBinding.instance.addPostFrameCallback((_) {
                final newPosition =
                    _scrollController.position.maxScrollExtent - newItemsHeight;
                _scrollController.jumpTo(newPosition > 0 ? newPosition : 0);
              });
            }
          }
        },
        builder: (context, state) {
          if (state is CommonErrorState) {
            return Center(child: Text(state.message));
          } else if (state is CommonLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CommonSuccessState<List<Data>>) {
            return ListView.separated(
              controller: _scrollController,
              itemCount: _allItems.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 150,
                  width: 200,
                  color: Colors.yellow.shade300,
                  child: Column(
                    children: [
                      Text(_allItems[index].id.toString()),
                      Text(_allItems[index].title.toString()),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10);
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
