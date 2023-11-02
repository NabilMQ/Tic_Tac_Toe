import 'package:flutter/material.dart';

class BlankContainer extends StatefulWidget {
  const BlankContainer({
     super.key,
     required this.flex,
    });

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