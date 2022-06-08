import 'package:flutter/material.dart';

class StandardButton extends StatefulWidget {
  final String buttonText;
  final double? height;
  final double? width;
  final VoidCallback? onPressed;
  final bool? active;

  const StandardButton({
    Key? key,
    required this.buttonText,
    this.height,
    this.width,
    required this.onPressed,
    this.active = true,
  }) : super(key: key);

  @override
  State<StandardButton> createState() => StandardButtonState();
}

class StandardButtonState extends State<StandardButton> {
  late bool _active = widget.active ?? true;

  void onChange(bool value) {
    _active = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  _active ? const Color(0xff38C24E) : Colors.grey)),
          onPressed: _active ? widget.onPressed : null,
          child: Text(
            widget.buttonText,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )),
    );
  }
}
