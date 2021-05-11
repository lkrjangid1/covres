import 'package:flutter/material.dart';

class TextButtonCus extends StatefulWidget {
  final page;
  final title;
  TextButtonCus({this.title, this.page});
  @override
  _TextButtonCusState createState() => _TextButtonCusState();
}

class _TextButtonCusState extends State<TextButtonCus> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => widget.page));
      },
      child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Color(0xFF63B3ED),
          ),
          child: Text(widget.title,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ))),
    );
  }
}
