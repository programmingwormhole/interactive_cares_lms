import 'package:flutter/material.dart';
import 'package:interactive_cares_lms/utils/themes.dart';


class CustomTextField extends StatelessWidget {
  final String hintText;
  final String? labelText;
  final String? topLabelText;
  final TextInputType? keyboardType;
  final bool? isSecured;
  final Widget? suffixIcon;
  final IconData? prefixIcon;
  final bool? isRequired;
  final TextEditingController? controller;
  final bool? enabled;
  final bool? isLogin;
  final void Function(String)? onChanged;
  final String? errorText;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.keyboardType,
    this.isSecured,
    this.suffixIcon,
    this.prefixIcon,
    this.isRequired,
    this.controller,
    this.labelText,
    this.topLabelText,
    this.enabled,
    this.onChanged,
    this.errorText,
    this.isLogin,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        topLabelText == null ? const SizedBox() : TextFormat.small(text: topLabelText!),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          onChanged: onChanged,
          enabled: enabled ?? true,
          controller: controller,
          keyboardType: keyboardType,
          obscureText: isSecured ?? false,
          style: const TextStyle(fontWeight: FontWeight.w500),
          validator: isRequired == true
              ? (value) {
            if (value!.isEmpty) {
              return 'This field is required';
            }

            if (isLogin != true) {
              if (value.length < 8) {
                return 'Password must be at least 8 characters';
              }
            }
            return null;
          }
              : null,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.black.withOpacity(.5),
            ),
            filled: true,
            labelText: labelText,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.black.withOpacity(.2),
              ),
            ),
            prefixIcon: Icon(
              prefixIcon,
              color: Colors.black.withOpacity(.5),
            ),
            suffixIcon: suffixIcon,
            errorText: errorText
          ),
        ),
      ],
    );
  }
}