import 'package:get/get.dart';
import 'package:strong_password_generator/Core/Bindings/home_binding.dart';
import 'package:strong_password_generator/Core/Routes/names.dart';
import 'package:strong_password_generator/Screens/home_screen.dart';

class AppPages {
  static const String initial = AppPagesNames.home;
  static final List<GetPage> pages = [
    GetPage(
      name: AppPagesNames.home,
      binding: HomeBinding(),
      page: () => const HomeScreen(),
    )
  ];
}
