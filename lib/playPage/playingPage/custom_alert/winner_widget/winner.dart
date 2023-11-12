import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/globalData/data.dart';
import 'package:tic_tac_toe/globalWidget/blank_container.dart';
import 'package:tic_tac_toe/globalWidget/header.dart';
import 'package:tic_tac_toe/playPage/playingPage/data.dart';

class WinnerWidget extends StatefulWidget {
  const WinnerWidget({ super.key });

  @override
  State <WinnerWidget> createState() => _WinnerWidgetState();
}

class _WinnerWidgetState extends State <WinnerWidget> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: globalProvider,
      child: Consumer <Turn> (
        builder: (context, data, child) {
          return Expanded(
            flex: 3,
            child: Row(
              children: [
                BlankContainer(flex: 1),
        
                Expanded(
                  flex: 4,
                  child: Header(text: "${data.winner} Win"),
                ),
        
                BlankContainer(flex: 1),
              ],
            ),
          );
        },
      )
    );
  }
}