import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class PasswordField extends StatelessWidget {
  final bool obsecureText;
  final String hint;
  final String label;
  final TextEditingController? controller;
  final void Function()? onCopy;
  final void Function()? onTogglePassword;
  const PasswordField({
    super.key,
    required this.obsecureText,
    required this.hint,
    required this.label,
    this.onCopy,
    this.onTogglePassword,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      obscureText: obsecureText,
      // enabled: false,
      controller: controller,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        hintText: hint,
        label: Text(label),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        prefixIcon: const Icon(Icons.password),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: onCopy,
              tooltip: 'Copy',
              style: IconButton.styleFrom(
                shape: const CircleBorder(),
              ),
              icon: const Icon(Ionicons.copy_outline),
            ),
            IconButton(
              onPressed: onTogglePassword,
              tooltip: obsecureText ? 'Show' : 'Hide',
              style: IconButton.styleFrom(
                shape: const CircleBorder(),
              ),
              icon: Icon(
                obsecureText ? Ionicons.eye_outline : Ionicons.eye_off_outline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
