import 'package:flutter/material.dart';
import 'package:tic_tac_toe/globalWidget/blank_container.dart';
import 'package:tic_tac_toe/playPage/playingPage/custom_alert/content_widget/widget/back_to_menu.dart';
import 'package:tic_tac_toe/playPage/playingPage/custom_alert/content_widget/widget/play_again.dart';

class Content extends StatefulWidget {
  const Content({ super.key });

  @override
  State <Content> createState() => _ContentState();
}

class _ContentState extends State <Content> {
  @override
  Widget build(BuildContext context) {
    return const Expanded(
      flex: 11,
      child: Row(
        children: [
          BlankContainer(flex: 1),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                BackToMenu(),
                BlankContainer(flex: 1),
                PlayAgain(),
              ],
            ),
          ),
          BlankContainer(flex: 1),
        ],
      ),
    );
  }
}