import 'package:get/get.dart';
import 'package:shopapp/app/modules/home/provider/provider.dart';

class HomeController extends GetxController with StateMixin<List<dynamic>> {
  //TODO: Implement HomeController
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    Provider().getProduct().then((value) {
      change(value, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
