// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore, camel_case_types

import 'package:flutter/material.dart';

// ignore: camel_case_types
class sections extends StatefulWidget {
  final String text1;
  final String text2;
  final int id;
  const sections(
      {Key? key, required this.text1, required this.text2, required this.id})
      : super(key: key);

  @override
  State<sections> createState() => _sectionsState();
}

class _sectionsState extends State<sections> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 72,
        decoration: const BoxDecoration(
          color: Color.fromARGB(81, 255, 255, 255),

          // borderRadius: BorderRadius.circular(7.0),
          // color: color,
        ),
        child: Column(
          children: [
            Text(
              widget.text1,
            ),
            Text(
              widget.text2,
              // style: TextStyle(color: textColor),
            )
          ],
        ));
  }
}
