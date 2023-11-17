import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:strong_password_generator/Controller/home_controller.dart';
import 'package:strong_password_generator/Widgets/password_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Password Generator'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CheckboxListTile(
                      value: controller.isUpperCase,
                      onChanged: controller.toggleUpperCase,
                      title: const Text('Upper Case'),
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                    CheckboxListTile(
                      value: controller.isLowerCase,
                      onChanged: controller.toggleLowerCase,
                      title: const Text('Lower Case'),
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                    CheckboxListTile(
                      value: controller.isNumbers,
                      onChanged: controller.toggleNumbers,
                      title: const Text('Numbers'),
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                    CheckboxListTile(
                      value: controller.isSymbols,
                      onChanged: controller.toggleSymbols,
                      title: const Text('Symbols'),
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                    ListTile(
                      title: const Text('Password Length'),
                      subtitle: Slider(
                        value: controller.length,
                        onChanged: controller.changeLength,
                        max: 40,
                        min: 8,
                        divisions: 32,
                        label: '${controller.length}',
                      ),
                      trailing: Text(
                        '${controller.length.toString().padLeft(2, '0')} Characters',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              PasswordField(
                hint: 'Generate strong password',
                label: 'Password',
                obsecureText: controller.obsecured,
                controller: controller.passwordController,
                onCopy: controller.copy,
                onTogglePassword: controller.togglePassword,
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: !controller.isUpperCase &&
                        !controller.isLowerCase &&
                        !controller.isNumbers &&
                        !controller.isSymbols
                    ? null
                    : controller.generate,
                child: const Text(
                  'Generate',
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
