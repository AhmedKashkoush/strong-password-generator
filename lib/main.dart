import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:strong_password_generator/Core/Routes/pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Strong Password Generator',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        highlightColor: Colors.transparent,
        splashFactory: InkRipple.splashFactory,
      ),
      getPages: AppPages.pages,
      initialRoute: AppPages.initial,
    );
  }
}
