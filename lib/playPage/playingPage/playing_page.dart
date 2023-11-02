import 'package:flutter/material.dart';
import 'package:tic_tac_toe/globalData/data.dart';
import 'package:tic_tac_toe/globalWidget/blank_container.dart';
import 'package:tic_tac_toe/globalWidget/header.dart';
import 'package:provider/provider.dart';
import 'data.dart';
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
  void initState() {
    super.initState();
    globalProvider.newGame();
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ChangeNotifierProvider.value(
        value: globalProvider,
        child: Consumer <Turn> (
          builder: (context, data, child) {
            return Container(
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
                              child: Header(text: data.game),
                            ),
                            const BlankContainer(flex: 1),
                          ],
                        ),
                      ),
                      
                      const BlankContainer(flex: 9,),
                      
                      // board
                      Expanded(
                        flex: 33,
                        child: Row(
                          children: [
                            const BlankContainer(flex: 1),
                            Expanded(
                              flex: 6,
                              child: Board(data: data),
                            ),
                            const BlankContainer(flex: 1),
                          ],
                        ),
                      ),
                      
                      const BlankContainer(flex: 23),
                    ],
                  ),
          
                  // alert dialog
                  Builder(
                    builder: (context) {
                      if (data.completed) { // check if the game is completed
                        return const CustomAlert();
                      }
                      else { // if not completed yet
                        return const SizedBox.shrink(); 
                      }
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
