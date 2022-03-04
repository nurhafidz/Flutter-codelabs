// import 'dart:convert';
import 'package:get/get.dart';

class Provider extends GetConnect {
  Future<Map<String, dynamic>> getProductdetail(id) async {
    // final response = await get('https://fakestoreapi.com/products/' + id);
    final response = await get('https://fakestoreapi.com/products/' + id)
        .timeout(const Duration(seconds: 60));

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }
}
