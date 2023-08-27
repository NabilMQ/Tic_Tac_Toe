import 'package:flutter/material.dart';
import '../globalWidget/blank_container.dart';
import 'package:tic_tac_toe/playPage/selectModePage/select_mode_page.dart';
import 'package:tic_tac_toe/globalWidget/header.dart';
import 'package:tic_tac_toe/homePage/button.dart';
import 'package:tic_tac_toe/homePage/text_animation.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State <Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

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
            
            BlankContainer(flex: 6),
            
            // header
            Expanded(
              flex: 9,
              child: Row(
                children: [                
                  BlankContainer(flex: 1),
                  const Expanded(
                    flex: 6,
                    child: Header(text: "Tic Tac Toe"),
                  ),
                  BlankContainer(flex: 1),
                ],
              ),
            ),
            
            BlankContainer(flex: 11),

            // play button
            Expanded(
              flex: 7,
              child: Row(
                children: [
                  BlankContainer(flex: 1),
                  Expanded(
                    flex: 2,
                    child: Button(
                      text: "Play",
                      route: () {
                        Navigator.of(context).push(toSelectModePage());
                      }
                    ),
                  ),
                  BlankContainer(flex: 1),
                ],
              ),
            ),

            BlankContainer(flex: 5),

            // option button
            Expanded(
              flex: 7,
              child: Row(
                children: [
                  BlankContainer(flex: 1),
                  Expanded(
                    flex: 2,
                    child: Button(
                      text: "Option",
                    ),
                  ),

                  BlankContainer(flex: 1),
                ],
              ),
            ),

            BlankContainer(flex: 5),

            // quit button
            Expanded(
              flex: 7,
              child: Row(
                children: [
                  
                  BlankContainer(flex: 1),

                  Expanded(
                    flex: 2,
                    child: Button(
                      text: "Quit",
                    ),
                  ),

                  BlankContainer(flex: 1),

                ],
              ),
            ),


            BlankContainer(flex: 17),

            Expanded(
              flex: 5,
              child: Row(
                children: [
                  
                  BlankContainer(flex: 1),

                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        BlankContainer(flex: 1),
                        Expanded(
                          flex: 2,
                          child: TextAnimation(text: "Developed by Namuqi")),
                        BlankContainer(flex: 1),
                      ],
                    ),
                  ),

                  BlankContainer(flex: 1),

                ],
              ),
            ),

          ],
        )
      ),
    );
  }
}