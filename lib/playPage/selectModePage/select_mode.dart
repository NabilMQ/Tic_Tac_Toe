import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:tic_tac_toe/customIcons/my_flutter_app_icons.dart';

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
  const SelectMode({ Key? key }) : super(key: key);

  @override
  State <SelectMode> createState() => _SelectModeState();
}

class _SelectModeState extends State<SelectMode> {
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
            GridPlacement(
              columnStart: 1,
              columnSpan: 6,
              rowStart: 3,
              rowSpan: 5,
              child: Container(
                child: const Center(
                  child: Text(
                    "Select Mode",
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

            GridPlacement(
              columnStart: 2,
              columnSpan: 4,
              rowStart: 12,
              rowSpan: 9,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
              ),
            ),

            GridPlacement (
              columnStart: 2,
              columnSpan: 4,
              rowStart: 23,
              rowSpan: 9,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}