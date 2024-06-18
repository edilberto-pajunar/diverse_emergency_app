import 'package:flutter/material.dart';

class PrimaryTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool readOnly;
  final String? Function(String?)? validator;
  final int? maxLines;
  final Function()? onTap;
  final String? initialValue;
  final Function(String?)? onChanged;
  final bool isPassword;

  const PrimaryTextField({
    required this.hintText,
    this.controller,
    this.readOnly = false,
    this.validator,
    this.maxLines = 1,
    super.key,
    this.onTap,
    this.initialValue,
    this.onChanged,
    this.isPassword = false,
  });

  @override
  State<PrimaryTextField> createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          initialValue: widget.initialValue,
          onTap: widget.onTap,
          onChanged: widget.onChanged,
          readOnly: widget.readOnly,
          controller: widget.initialValue != null ? null : widget.controller,
          decoration: InputDecoration(
            hintText: widget.hintText,
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    icon: const Icon(Icons.remove_red_eye),
                  )
                : null,
          ),
          validator: widget.validator,
          maxLines: widget.maxLines,
          obscureText: widget.isPassword ? obscureText : false,
        ),
        const SizedBox(height: 12.0),
      ],
    );
  }
}
