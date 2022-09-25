import 'package:flutter/material.dart';

class RowLayout extends StatelessWidget {
  final String text;
  const RowLayout({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black,
      ),
      child: Center(
          child: Text(
        text,
        style: TextStyle(
            color: Colors.black, fontSize: 13, fontWeight: FontWeight.w500),
      )),
    );
  }
}
