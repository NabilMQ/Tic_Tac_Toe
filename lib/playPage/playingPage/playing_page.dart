import 'package:flutter/material.dart';
import 'package:tic_tac_toe/globalData/audio.dart';
import 'package:tic_tac_toe/globalData/data.dart';
import 'package:tic_tac_toe/globalWidget/blank_container.dart';
import 'package:tic_tac_toe/globalWidget/header.dart';
import 'package:tic_tac_toe/playPage/playingPage/widget/board.dart';
import 'package:tic_tac_toe/playPage/playingPage/custom_alert/custom_alert.dart';

Route toPlayingPage() {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 250),
    reverseTransitionDuration: const Duration(milliseconds: 250),
    fullscreenDialog: true,
    pageBuilder: (context, animation, secondaryAnimation) => const PlayingPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      Offset begin = const Offset(1.0, 0.0);
      Offset end = Offset.zero;
      Curve curve = Curves.easeInOutCirc;
      Animatable <Offset> tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    }
  );
}

class PlayingPage extends StatefulWidget {
  const PlayingPage({ super.key });

  @override
  State <PlayingPage> createState() => _PlayingPageState();
}


class _PlayingPageState extends State<PlayingPage> {

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: const Color.fromARGB(100, 250, 250, 250),
        child: Stack(
          children: [
            Column(  
              children: [
                const BlankContainer(flex: 6),
                
                // header
                Expanded(
                  flex: 9,
                  child: Row(
                    children: [
                      const BlankContainer(flex: 1),
                      Expanded(
                        flex: 6,
                        child: ValueListenableBuilder(
                          valueListenable: turn,
                          builder: (context, value, child) {
                            return Header(text: value);
                          },
                        ),
                      ),
                      const BlankContainer(flex: 1),
                    ],
                  ),
                ),
                
                const BlankContainer(flex: 9,),
                
                // board
                const Expanded(
                  flex: 33,
                  child: Row(
                    children: [
                      BlankContainer(flex: 1),
                      Expanded(
                        flex: 6,
                        child: Board(),
                      ),
                      BlankContainer(flex: 1),
                    ],
                  ),
                ),
                
                const BlankContainer(flex: 23),
              ],
            ),
    
            // alert dialog
            ListenableBuilder(
              listenable: game,
              builder: (context, child) {
                if (draw.value) {
                  playDrawSound();
                  return const CustomAlert();
                }
                else if (completed.value) { // check if the game is completed
                  if (isPVC.value && winner.value == "Computer") {
                    playLosingSound();
                  }
                  else if (isPVC.value || isPVP.value){
                    playWinningSound();
                  }
                  return const CustomAlert();
                }
                else { // if not completed yet
                  return const SizedBox.shrink(); 
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
