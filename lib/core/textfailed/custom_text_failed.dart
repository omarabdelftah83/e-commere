import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    this.hintText,
    this.keyboardType,
    this.isPassword = false,
    this.obscureText = false,//hide text
    this.isSelectable = false,
    this.onChanged,
    this.prefixIcon,
    this.errorText,
    this.controller,
    this.suffixIcon,
  }) : super(key: key);

  final bool isPassword;
  final bool isSelectable;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final Icon? prefixIcon;
  final String? errorText;
  final TextEditingController? controller;
  final Widget? suffixIcon;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword ? _obscureText : widget.obscureText,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        suffixIcon: widget.suffixIcon ??

            (widget.isPassword
                ? IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            )
                : null),
        errorText: widget.errorText == null || widget.errorText!.isEmpty
            ? null
            : widget.errorText,
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding:
        const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      ),
    );
  }
}
