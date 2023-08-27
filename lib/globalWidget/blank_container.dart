import 'package:flutter/material.dart';

class BlankContainer extends StatefulWidget {
  const BlankContainer({
     Key? key,
     required this.flex,
    }) : super(key: key);

  final int flex;

  @override
  State <BlankContainer> createState() => _BlankContainerState();
}

class _BlankContainerState extends State<BlankContainer> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: widget.flex,
      child: const SizedBox.expand(),
    );
  }
}