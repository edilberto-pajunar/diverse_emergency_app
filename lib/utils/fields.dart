import 'package:flutter/material.dart';

class PrimaryTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool readOnly;
  final String? Function(String?)? validator;
  final int? maxLines;

  const PrimaryTextField({
    required this.hintText,
    required this.controller,
    this.readOnly = false,
    this.validator,
    this.maxLines = 1,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          readOnly: readOnly,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
          ),
          validator: validator,
          maxLines: maxLines,
        ),
        const SizedBox(height: 12.0),
      ],
    );
  }
}
