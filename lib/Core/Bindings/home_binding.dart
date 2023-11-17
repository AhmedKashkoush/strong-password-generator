import 'package:get/get.dart';
import 'package:strong_password_generator/Controller/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
