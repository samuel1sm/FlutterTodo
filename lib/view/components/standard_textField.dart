import 'package:flutter/material.dart';

class StandardTextField extends StatefulWidget {
  final String hintText;
  final String? Function(String?) validator;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final Function(String?)? onUpdated;

  const StandardTextField({
    Key? key,
    required this.hintText,
    required this.validator,
    this.onSaved,
    this.onChanged,
    this.onUpdated,
  }) : super(key: key);

  @override
  State<StandardTextField> createState() => StandardTextFieldState();
}

class StandardTextFieldState extends State<StandardTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => widget.validator(value),
      onChanged: (value) {
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        } else if (widget.onUpdated != null) {
          widget.onUpdated!(value);
        }
      },
      onSaved: (value) {
        if (widget.onSaved != null) {
          widget.onChanged!(value);
        } else if (widget.onUpdated != null) {
          widget.onUpdated!(value);
        }
      },
      decoration: InputDecoration(
          hintText: widget.hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide.none,
          ),
          fillColor: Colors.white,
          filled: true),
    );
  }
}
