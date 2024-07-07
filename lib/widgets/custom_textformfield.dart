import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    super.key,
    required this.controller,
    this.validationFunc,
    required this.width,
    required this.height,
    this.onChanged,
    this.inputAction,
  });

  final TextEditingController controller;
  final double width;
  final double height;
  final void Function(String text)? onChanged;
  final TextInputAction? inputAction;
  final String? Function(String?)? validationFunc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        autofocus: true,
        onChanged: onChanged,
        cursorColor: Colors.black87,
        cursorWidth: 2,
        controller: controller,
        textInputAction: inputAction,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 18,
          color: Colors.black,
        ),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white54,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Colors.white54,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Colors.white54,
              width: 2,
            ),
          ),
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}
