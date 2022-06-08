import 'package:flutter/material.dart';

class StandartButton extends StatelessWidget {
  final String buttonText;
  final double? height;
  final double? width;
  final VoidCallback? onPressed;

  const StandartButton({
    Key? key,
    required this.buttonText,
    this.height,
    this.width,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(const Color(0xff38C24E))),
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )),
    );
  }
}
