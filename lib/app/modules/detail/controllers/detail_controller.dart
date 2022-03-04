import 'package:get/get.dart';
import 'package:shopapp/app/modules/detail/provider/detail_provider.dart';

class DetailController extends GetxController
    with StateMixin<Map<String, dynamic>> {
  //TODO: Implement DetailController
  var one = Get.arguments;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    if (one == null) {
      print("gagal");
    } else {
      print(one);
    }

    Provider().getProductdetail(one).then((value) {
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
