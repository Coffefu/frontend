import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoadActivity extends StatefulWidget {
  const LoadActivity({Key? key}) : super(key: key);

  @override
  _LoadActivityWidgetState createState() => _LoadActivityWidgetState();
}

class _LoadActivityWidgetState extends State<LoadActivity> {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Cofefu", style: TextStyle(fontSize: 40)),
                  // REDO use SvgPicture.assets
                  SvgPicture.network('http://10.0.2.2:8000/favicon.svg')
                ],
              ),
              const SizedBox(height: 10),
              const SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                  color: Color(0xFF7D5DFF),
                ),
              ),
            ],
          ),
        ));
  }
}
