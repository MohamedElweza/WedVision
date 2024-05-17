import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required TextEditingController nameController, required this.label, required this.hint, required this.secure,
  }) : _nameController = nameController;

  final TextEditingController _nameController;
  final String label;
  final String hint;
  final bool secure;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _nameController,
      obscureText: secure,
      decoration:  InputDecoration(
          border:  const OutlineInputBorder(
              borderSide:  BorderSide(color: Colors.white12)
          ),
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontFamily: 'MainFont',),
          labelStyle:  const TextStyle(
            color: primaryColor,
            fontFamily: 'MainFont',
          ),
          labelText: label,
          prefixText: ' '
      ),);
  }
}