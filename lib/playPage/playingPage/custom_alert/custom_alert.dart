import 'package:flutter/material.dart';
import 'package:tic_tac_toe/globalWidget/blank_container.dart';
import 'package:tic_tac_toe/playPage/playingPage/custom_alert/winner_widget/winner.dart';
import 'package:tic_tac_toe/playPage/playingPage/custom_alert/content_widget/content.dart';

class CustomAlert extends StatefulWidget {
  const CustomAlert({ super.key });

  @override
  State <CustomAlert> createState() => _CustomAlertState();
}

class _CustomAlertState extends State <CustomAlert> {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return PopScope(
      canPop: false,
      child: Container(
        width: width,
        height: height,
        color: const Color.fromRGBO(0, 0, 0, 0.3),
        child: Column(
          children: [
            const BlankContainer(flex: 28),
      
            // custom alert
            Expanded(
              flex: 27,
              child: Row(
                children: [
                  const BlankContainer(flex: 1),
                  Expanded(
                    flex: 6,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 250, 250, 250),
                      ),
                      child: const Column(
                        children: [
                          BlankContainer(flex: 4),
      
                          // header
                          WinnerWidget(),
      
                          BlankContainer(flex: 4),
      
                          // content
                          Content(),
      
                          BlankContainer(flex: 4),
                        ],
                      )
                    ),
                  ),
      
                  const BlankContainer(flex: 1),
                ],
              ),
            ),
      
            const BlankContainer(flex: 24),
          ],
        ),
      ),
    );
  }
}