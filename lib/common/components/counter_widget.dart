import 'package:flutter/material.dart';

class CounterView extends StatefulWidget {
  final int maxValue;
  final double? width;

  const CounterView({Key? key, this.maxValue = 10, this.width = 128})
      : super(key: key);

  @override
  _CounterViewState createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  int _count = 0;

  get count => _count;

  set count(value) {
    if (value < 0) {
      _count = 0;
      return;
    }

    _count = value > widget.maxValue ? widget.maxValue : value;
  }

  void _reduce() async => setState(() => --count);

  void _increase() async => setState(() => ++count);

  RawMaterialButton getButton(IconData icon, VoidCallback onPressed) {
    return RawMaterialButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
      onPressed: onPressed,
      elevation: 2,
      // fillColor: Colors.grey.shade200,
      // fillColor: Colors.white,
      child: Icon(icon),
      shape: const CircleBorder(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        border: Border.all(width: 2, color: Colors.grey.shade200),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          getButton(Icons.remove, _reduce),
          Text(
            count.toString(),
            style: const TextStyle(fontSize: 24),
          ),
          getButton(Icons.add, _increase),
        ],
      ),
    );
  }
}
