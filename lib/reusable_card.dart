import "package:flutter/material.dart";

class Reusable_card extends StatelessWidget {
  Reusable_card({this.color, this.Cardchild, this.onpress});

  final Color? color;
  final Widget? Cardchild;
  final VoidCallback? onpress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        child: Cardchild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
