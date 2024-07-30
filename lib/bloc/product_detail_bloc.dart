import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siddharth/bloc/fetch_product_event.dart';
import 'package:siddharth/common/bloc/common_state.dart';
import 'package:siddharth/repo/product_repo.dart';

import '../models/product_detail.dart';

class FetchProductDetailBloc extends Bloc<ProductDetailEvent,CommonState> {
  final ProductRepository repository;
  FetchProductDetailBloc({required this.repository}):super(CommonInitialState()){

on<FetchProductEvent>((event,emit)async{
emit(CommonLoadingState(showLoading: true));
final res=await repository.fetchProductDetail(isLoadMore: false,makeId:event.makeId );
res.fold(
  (err)=>emit(CommonErrorState(message: err)),
  (data)=>emit(CommonSuccessState<List<Data>>(item: data)),
);
});

on<LoadMoreProductEvent>((event,emit)async{
emit(CommonLoadingState(showLoading: false));
final res=await repository.fetchProductDetail(isLoadMore: true,makeId:event.makeId);
res.fold(
  (err)=>emit(CommonErrorState(message: err)),
  (data)=>emit(CommonSuccessState<List<Data>>(item: data)),
);
},
transformer: droppable(),

);
  }


}