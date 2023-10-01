import 'package:flutter/material.dart';
import 'package:tic_tac_toe/customIcons/my_flutter_app_icons.dart';
import 'package:tic_tac_toe/globalData/data.dart';
import 'package:tic_tac_toe/globalWidget/blank_container.dart';
import 'package:tic_tac_toe/globalWidget/header.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'data.dart';

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
                                    child: GestureDetector(
                                      onTap: () {
                                        if (data.isClicked(index ~/ 3, index % 3) == false) {
                                          if (data.numberTurn % 2 == 1) {
                                            data.setBoard(index ~/ 3, index % 3, 1);
                                          }
                                          else {
                                            data.setBoard(index ~/ 3, index % 3, 2);
                                          }
                                          data.checkBoard();
                                          data.numberTurn++;
                                        }
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: Colors.white,
                                        ),
                                        child: AnimatedScale(
                                          scale: data.board[index ~/ 3][index % 3] != 0 ? 1.0 : 0.0,
                                          curve: Curves.easeOutExpo,
                                          duration: const Duration(milliseconds: 500),
                                          child: SvgPicture.asset(
                                            data.board[index ~/ 3][index % 3] % 2 == 1 ? data.oShape : data.xShape, 
                                          ),
                                        )
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
          
                  Builder(
                    builder: (context) {
                      if (data.completed) {
                        return Container(
                          width: width,
                          height: height,
                          color: const Color.fromRGBO(0, 0, 0, 0.3),
                          child: Column(
                            children: [
                              const BlankContainer(flex: 28),
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
                                        child: Column(
                                          children: [
                                            const BlankContainer(flex: 4),

                                            Expanded(
                                              flex: 3,
                                              child: Row(
                                                children: [
                                                  const BlankContainer(flex: 1),

                                                  Expanded(
                                                    flex: 4,
                                                    child: Container(
                                                      child: const Header(text: "You Win")
                                                    ),
                                                  ),

                                                  const BlankContainer(flex: 1),
                                                ],
                                              ),
                                            ),

                                            const BlankContainer(flex: 4),

                                            Expanded(
                                              flex: 11,
                                              child: Row(
                                                children: [
                                                  const BlankContainer(flex: 1),

                                                  Expanded(
                                                    flex: 4,
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 11,
                                                          child: Center(
                                                            child: AspectRatio(
                                                              aspectRatio: 1,
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(20),
                                                                  color: Colors.white,
                                                                ),
                                                                child: Column(
                                                                  children: [
                                                                    BlankContainer(flex: 2),
                                                              
                                                                    Expanded(
                                                                      flex: 3,
                                                                      child: Icon(
                                                                        CustomIcons.menu_button_wide,
                                                                        fill: 1.0,
                                                                      ),
                                                                    ),
                                                              
                                                                    BlankContainer(flex: 2),
                                                              
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child: Row(
                                                                        children: [
                                                                          BlankContainer(flex: 1),

                                                                          Expanded(
                                                                            flex: 9,
                                                                            child: Center(
                                                                              child: FittedBox(
                                                                                fit: BoxFit.scaleDown,
                                                                                child: Text(
                                                                                  "Back To Menu",
                                                                                  style: TextStyle(
                                                                                      fontFamily: "Roboto Condensed",
                                                                                      fontWeight: FontWeight.normal,
                                                                                      fontSize: 24,
                                                                                      letterSpacing: 0,
                                                                                    ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),

                                                                          BlankContainer(flex: 1),
                                                                        ],
                                                                      ),
                                                                    ),
                                                              
                                                                    BlankContainer(flex: 2),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),

                                                        const BlankContainer(flex: 1),

                                                        Expanded(
                                                          flex: 11,
                                                          child: Center(
                                                            child: AspectRatio(
                                                              aspectRatio: 1,
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(20),
                                                                  color: Colors.white,
                                                                ),
                                                                child: Column(
                                                                  children: [
                                                                    BlankContainer(flex: 2),
                                                              
                                                                    Expanded(
                                                                      flex: 3,
                                                                      child: Icon(
                                                                        CustomIcons.play,
                                                                        fill: 1.0,
                                                                      ),
                                                                    ),
                                                              
                                                                    BlankContainer(flex: 2),
                                                              
                                                                     Expanded(
                                                                      flex: 2,
                                                                      child: Row(
                                                                        children: [
                                                                          BlankContainer(flex: 1),

                                                                          Expanded(
                                                                            flex: 9,
                                                                            child: Center(
                                                                              child: FittedBox(
                                                                                fit: BoxFit.scaleDown,
                                                                                child: Text(
                                                                                  "Play Again",
                                                                                  style: TextStyle(
                                                                                      fontFamily: "Roboto Condensed",
                                                                                      fontWeight: FontWeight.normal,
                                                                                      fontSize: 24,
                                                                                      letterSpacing: 0,
                                                                                    ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          
                                                                          BlankContainer(flex: 1),
                                                                        ],
                                                                      ),
                                                                    ),
                                                              
                                                                    BlankContainer(flex: 2),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                  const BlankContainer(flex: 1),
                                                ],
                                              ),
                                            ),

                                            const BlankContainer(flex: 4),
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
                        );
                      }
                      else {
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
