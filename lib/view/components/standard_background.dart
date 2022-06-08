import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final List<Widget> children;
  const BackgroundWidget({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [const Background(), for (Widget child in children) child],
    );
  }
}

class Background extends StatelessWidget {
  const Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Image.asset(
        "assets/images/background.png",
        fit: BoxFit.cover,
      ),
    );
  }
}
