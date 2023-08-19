import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'button.dart';
import 'package:tic_tac_toe/playPage/selectModePage/select_mode.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State <Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation <int> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _colorAnimation = IntTween(begin: 230, end: 200).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

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
              child: Button(
                text: "Tic Tac Toe",
                fontSize: 24,
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
    
            GridPlacement(
              columnStart: 2,
              columnSpan: 4,
              rowStart: 37,
              rowSpan: 2,
              child: Center(
                child: AnimatedBuilder(
                  animation: _colorAnimation,
                  builder: (context, child) {
                    return Text(
                      "Developed by Namuqi",
                      style: TextStyle(
                        color: Color.fromARGB(255,  _colorAnimation.value, _colorAnimation.value, _colorAnimation.value),
                        fontFamily: "Roboto Condensed",
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                        letterSpacing: 0,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}