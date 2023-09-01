import 'package:flutter/material.dart';
import 'package:tic_tac_toe/globalWidget/blank_container.dart';
import 'package:tic_tac_toe/globalWidget/header.dart';

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
  const PlayingPage({ Key? key }) : super(key: key);

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
        child: Column(
          children: [
            const BlankContainer(flex: 6),

            const Expanded(
              flex: 9,
              child: Row(
                children: [
                  BlankContainer(flex: 1),
                  Expanded(
                    flex: 6,
                    child: Header(text: "Your Turn"),
                  ),
                  BlankContainer(flex: 1),
                ],
              ),
            ),

            const BlankContainer(flex: 9,),

            Expanded(
              flex: 33,
              child: Row(
                children: [
                  const BlankContainer(flex: 1),
                  Expanded(
                    flex: 6,
                    child: GridView.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: 7.5,
                      crossAxisSpacing: 7.5,
                      children: List.generate(9, (index) {
                        return AspectRatio(
                          aspectRatio: 1.0 / 1.0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  const BlankContainer(flex: 1),
                ],
              ),
            ),

            const BlankContainer(flex: 23),
          ],
        ),
      ),
    );
  }
}
