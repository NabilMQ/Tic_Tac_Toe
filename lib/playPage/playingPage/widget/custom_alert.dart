import 'package:flutter/material.dart';
import 'package:tic_tac_toe/globalWidget/blank_container.dart';
import 'package:tic_tac_toe/globalWidget/header.dart';
import 'package:tic_tac_toe/customIcons/my_flutter_app_icons.dart';

class CustomAlert extends StatefulWidget {
  const CustomAlert({ Key? key }) : super(key: key);

  @override
  State <CustomAlert> createState() => _CustomAlertState();
}

class _CustomAlertState extends State <CustomAlert> {
  @override

  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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

                        const Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              BlankContainer(flex: 1),

                              Expanded(
                                flex: 4,
                                child: Header(text: "You Win"),
                              ),

                              BlankContainer(flex: 1),
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
}