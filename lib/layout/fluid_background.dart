import 'package:flutter/material.dart';

class FluidBackground extends StatelessWidget {
  const FluidBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover),
      ),
      child: child,
    );
  }
}
