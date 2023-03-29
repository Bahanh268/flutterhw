import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key,
      required this.title,
      required this.icon,
      required this.onPress});

  final String title;
  final Widget icon;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onPress,
        style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(width: 2, color: Colors.black54))),
        child: Row(children: [
          Container(
            margin: const EdgeInsets.only(
              right: 10,
            ),
            child: icon,
          ),
          Text(
            title,
          )
        ]));
  }
}
