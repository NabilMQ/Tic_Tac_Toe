import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({ Key? key, required this.text }) : super(key: key);

  final String text;

  @override
  State <Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Center(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            widget.text,
            style: const TextStyle(
                fontFamily: "Roboto Condensed",
                fontWeight: FontWeight.normal,
                fontSize: 24,
                letterSpacing: 0,
              ),
          ),
        ),
      ),
    );
  }
}