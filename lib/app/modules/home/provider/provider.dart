import 'package:get/get.dart';

class Provider extends GetConnect {
  Future<List<dynamic>> getProduct() async {
    final response = await get('https://fakestoreapi.com/products')
        .timeout(const Duration(seconds: 60));
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      // print(response.body);
      return response.body;
    }
  }
}
