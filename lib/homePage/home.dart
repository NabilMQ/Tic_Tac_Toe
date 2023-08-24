import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:tic_tac_toe/playPage/selectModePage/select_mode_page.dart';
import 'package:tic_tac_toe/globalWidget/header.dart';
import 'package:tic_tac_toe/homePage/button.dart';
import 'package:tic_tac_toe/homePage/text_animation.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State <Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: const Color.fromARGB(100, 250, 250, 250),
        child: LayoutGrid(
          columnSizes: List.generate(8, (index) => 1.fr),
          rowSizes: List.generate(40, (index) => 1.fr),
          columnGap: 8,
          rowGap: 8,
          children: [
            const GridPlacement(
              columnStart: 1,
              columnSpan: 6,
              rowStart: 3,
              rowSpan: 5,
              child: Header(
                text: "Tic Tac Toe",
              )
            ),
    
            GridPlacement(
              columnStart: 2,
              columnSpan: 4,
              rowStart: 13,
              rowSpan: 4,
              child: Button(
                text: "Play",
                fontSize: 16,
                route: () {
                  Navigator.of(context).push(toSelectModePage());
                }
              )
            ),
    
            const GridPlacement(
              columnStart: 2,
              columnSpan: 4,
              rowStart: 19,
              rowSpan: 4,
              child: Button(
                text: "Option",
                fontSize: 16,
              )
            ),
    
            const GridPlacement(
              columnStart: 2,
              columnSpan: 4,
              rowStart: 25,
              rowSpan: 4,
              child: Button(
                text: "Quit",
                fontSize: 16,
              )
            ),
    
            const GridPlacement(
              columnStart: 2,
              columnSpan: 4,
              rowStart: 37,
              rowSpan: 2,
              child: TextAnimation(
                text: "Developed by Namuqi",
              ),
            ),
          ],
        ),
      ),
    );
  }
}