import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../models/product_detail.dart';
import '../models/product_model.dart';

class ProductRepository {
  final Dio dio = Dio();
  final List<Data> _items = [];
  List<Data> get items => _items;
  int _page = 1;
  int _totalProductCount = -1;

  Future<Either<String, List<Data>>> fetchProductDetail(
      {bool isLoadMore = false, int? makeId}) async {
    print("Total Items: $_totalProductCount");
    try {
      if (
          // _items.length == _totalProductCount && isLoadMore
          _items.length == 18 && isLoadMore) {
        log('Both total items and loadmore called');
        return Right(_items);
      } else if (isLoadMore) {
        _page++;
        log('Only loadmore called');
      } else {
        _items.clear();
        _totalProductCount = -1;
        _page = 1;

        log('Except both case called');
      }
      final Map<String, dynamic> param = {
        "page": _page,
        "paginate": 6,
        "make_id": makeId
      };

      final res = await dio.get(
        "https://site.webcreationcanada.com/ds/api/get-vehicle-filter-list",
        queryParameters: param,
      );
      List<dynamic> result = res.data['data']['vehicles']['data'];
      if (result.isEmpty) {
        return const Left("No data available");
      }

      final temp = List.from(result).map((e) => Data.fromJson(e)).toList();
      // temp.shuffle();
      _totalProductCount = res.data['data']['vehicles']['total'];
      if (isLoadMore) {
        _items.addAll(temp); // Append new items to the existing list
      } else {
        _items.clear();
        _items.addAll(temp); // Initialize the list with fetched items
      }

      return Right(_items);
    } on DioException catch (e) {
      return Left(e.response?.data["message"] ?? "Unable to fetch products");
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<Make>>> fetchProduct() async {
    try {
      final response = await dio.get(
          'https://site.webcreationcanada.com/ds/api/get-makes-with-count');
      if (response.statusCode == 200) {
        final products = List.from(response.data['data']['makes'])
            .map((e) => Make.fromMap(e))
            .toList();
        return Right(products);
      } else {
        return Left(
            'Error fetching products: ${response.statusCode} - ${response.data['error']['message'] ?? 'No error message provided'}');
      }
    } catch (e) {
      return Left('Error occurs: $e');
    }
  }
}
