import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/customIcons/my_flutter_app_icons.dart';
import 'package:tic_tac_toe/globalData/data.dart';
import 'package:tic_tac_toe/globalWidget/blank_container.dart';
import 'package:tic_tac_toe/playPage/playingPage/data.dart';
import 'package:tic_tac_toe/playPage/playingPage/playing_page.dart';

class PlayAgain extends StatefulWidget {
  const PlayAgain({ super.key });

  @override
  State <PlayAgain> createState() => _PlayAgainState();
}

class _PlayAgainState extends State<PlayAgain> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: globalProvider,
      child: Consumer <Turn> (
        builder: (context, data, child) {
          return Expanded(
            flex: 11,
            child: Center(
              child: AspectRatio(
                aspectRatio: 1,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    data.numberTurn = 1;
                    data.draw = false;
                    data.pvc ? data.setPVCTurn = data.numberTurn : data.setPVPTurn = data.numberTurn;
                    Navigator.of(context).push(toPlayingPage());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: const Column(
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
          );
        },
      ),
    );
  }
}