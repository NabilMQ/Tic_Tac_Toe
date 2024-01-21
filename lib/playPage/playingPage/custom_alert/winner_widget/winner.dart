import 'package:flutter/material.dart';
import 'package:tic_tac_toe/globalData/data.dart';
import 'package:tic_tac_toe/globalWidget/blank_container.dart';
import 'package:tic_tac_toe/globalWidget/header.dart';

class WinnerWidget extends StatefulWidget {
  const WinnerWidget({ super.key });

  @override
  State <WinnerWidget> createState() => _WinnerWidgetState();
}

class _WinnerWidgetState extends State <WinnerWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Row(
        children: [
          const BlankContainer(flex: 1),

          Expanded(
            flex: 4,
            child: Header(text: draw.value ? "Draw" : "${winner.value} Win"),
          ),

          const BlankContainer(flex: 1),
        ],
      ),
    );
  }
}