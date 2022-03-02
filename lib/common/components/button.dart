import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final GestureTapCallback? onTap;
  final Widget? child;
  final Color color;
  final Color highlightColor;
  final Color splashColor;
  final BorderRadius? borderRadius;

  const Button({
    Key? key,
    required this.onTap,
    this.child,
    this.color = Colors.blue,
    this.highlightColor = Colors.transparent,
    this.splashColor = Colors.white30,
    this.borderRadius,
  }) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: widget.borderRadius ?? BorderRadius.circular(20),
      color: widget.color,
      textStyle: const TextStyle(
          color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700),
      child: InkWell(
        highlightColor: widget.highlightColor,
        splashColor: widget.splashColor,
        borderRadius: widget.borderRadius ?? BorderRadius.circular(20),
        onTap: widget.onTap,
        child: widget.child,
      ),
    );
  }
}
