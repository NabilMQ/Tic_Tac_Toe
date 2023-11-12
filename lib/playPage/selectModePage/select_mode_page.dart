import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/customIcons/my_flutter_app_icons.dart';
import 'package:tic_tac_toe/globalData/data.dart';
import 'package:tic_tac_toe/globalWidget/header.dart';
import 'package:tic_tac_toe/globalWidget/blank_container.dart';
import 'package:tic_tac_toe/playPage/playingPage/data.dart';
import 'button.dart';
import 'package:tic_tac_toe/playPage/playingPage/playing_page.dart';

Route toSelectModePage() {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 250),
    reverseTransitionDuration: const Duration(milliseconds: 250),
    fullscreenDialog: true,
    pageBuilder: (context, animation, secondaryAnimation) => const SelectMode(),
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

class SelectMode extends StatefulWidget {
  const SelectMode({ super.key });

  @override
  State <SelectMode> createState() => _SelectModeState();
}

class _SelectModeState extends State<SelectMode> {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider.value(
      value: globalProvider,
      child: Consumer <Turn> (
        builder: (context, data, child) {
          return Scaffold(
            body: Container(
              width: width,
              height: height,
              color: const Color.fromARGB(100, 250, 250, 250),
              child: Column(
                children: [
                  const BlankContainer(flex: 6),
            
                  // header
                  const Expanded(
                    flex: 9,
                    child: Row(
                      children: [
                        BlankContainer(flex: 1),
                        Expanded(
                          flex: 6,
                          child: Header(
                            text: "Select Mode",
                          ),
                        ),
                        BlankContainer(flex: 1),
                      ],
                    )
                  ),
            
                  const BlankContainer(flex: 9),
            
                  // Player vs Computer
                  Expanded(
                    flex: 17,
                    child: Row(
                      children: [
                        const BlankContainer(flex: 1),
                        Expanded(
                          flex: 2,
                          child: Button(
                            text: "Player Vs Computer",
                            icon: CustomIcons.laptop,
                            route: () {
                              data.setGame = "PVC";
                              data.pvc ? data.setPVCTurn = data.numberTurn : data.setPVPTurn = data.numberTurn;
                              Navigator.of(context).push(toPlayingPage());
                            },
                          ),
                        ),
                        const BlankContainer(flex: 1),
                      ],
                    ),
                  ),
            
                  const BlankContainer(flex: 5),
            
                  // Player vs Player
                  Expanded(
                    flex: 17,
                    child: Row(
                      children: [
                        const BlankContainer(flex: 1),
                        Expanded(
                          flex: 2,
                          child: Button(
                            text: "Player Vs Player",
                            icon: CustomIcons.person,
                            route: () {
                              data.setGame = "PVP";
                              data.pvc ? data.setPVCTurn = data.numberTurn : data.setPVPTurn = data.numberTurn;
                              Navigator.of(context).push(toPlayingPage());
                            },
                          ),
                        ),
                        const BlankContainer(flex: 1),
                      ],
                    ),
                  ),
            
                  const BlankContainer(flex: 16),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}