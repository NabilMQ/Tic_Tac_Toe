import 'package:flutter/material.dart';
import 'package:tic_tac_toe/customIcons/my_flutter_app_icons.dart';
import 'package:tic_tac_toe/globalData/audio.dart';
import 'package:tic_tac_toe/globalData/data.dart';
import 'package:tic_tac_toe/globalWidget/blank_container.dart';

class BackToMenu extends StatefulWidget {
  const BackToMenu({ super.key });

  @override
  State <BackToMenu> createState() => _BackToMenuState();
}

class _BackToMenuState extends State<BackToMenu> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 11,
      child: Center(
        child: AspectRatio(
          aspectRatio: 1,
          child: GestureDetector(
            onTap: () {
              playClickSound();
              numberTurn.value = 1;
              draw.value = false;
              isPVC.value = false;
              isPVP.value = false;
              Navigator.of(context).pop();
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
    );
  }
}