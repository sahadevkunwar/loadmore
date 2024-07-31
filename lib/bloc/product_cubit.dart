import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siddharth/common/bloc/common_state.dart';
import 'package:siddharth/repo/product_repo.dart';

import '../models/product_model.dart';

class ProductCubit extends Cubit<CommonState> {
  ProductRepository productRepository;
  ProductCubit({required this.productRepository}) : super(CommonInitialState());
   void fetchProducts() async {
      emit(CommonLoadingState());
      final res = await productRepository.fetchProduct();
      res.fold(
        (error) => emit(CommonErrorState(message: error)),
        (data) => emit(CommonSuccessState<Product>(item: data)),
      );
   }
}