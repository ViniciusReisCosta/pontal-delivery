

import 'dart:convert';

import 'package:pontal_delivery/constants/endpoints.dart';
import 'package:pontal_delivery/models/category_model.dart';
import 'package:pontal_delivery/pages/home/result/home_result.dart';
import 'package:pontal_delivery/services/http_manager.dart';

class HomeRepository {

  final _httpManager = HttpManager();

  Future<HomeResult> getAllCategories() async {
    final result = await _httpManager.restRequest(
      url: Endpoints.getAllCategories,
      method: HttpMethods.post,
    );

    if (result['result'] != null) {
      List<CategoryModel> data = (result['result'] as List)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList();

      return HomeResult<CategoryModel>.success(data);
    } else {
      return HomeResult.error('Ocorreu um erro inesperado ao recuperar as categorias');
    }
  }
}