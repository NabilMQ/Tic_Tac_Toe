import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({ 
    Key? key,
    required this.text,
    required this.fontSize,
    this.route,
    this.isPop = false,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final Function? route;
  final bool isPop;

  @override
  State <Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> with TickerProviderStateMixin {

  late AnimationController _controllerColor;
  late Animation <int> _colorAnimation;

  @override
  void initState() {
    super.initState();

    if (widget.route != null && widget.isPop != false) {
      throw "Route or Pop?";
    }

    _controllerColor = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    _colorAnimation = IntTween(begin: 0, end: 115).animate(
      CurvedAnimation(
        parent: _controllerColor,
        curve: Curves.easeInOut
      ),
    );
  }

  @override
  void dispose() {
    _controllerColor.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        _controllerColor.forward();
        Future.delayed(const Duration(milliseconds: 250), () {
          _controllerColor.reverse();
        });

        Future.delayed(const Duration(milliseconds: 250), () {
          if (widget.route != null) {
            widget.route!.call();
          }
          
          if (widget.isPop) {
            Navigator.of(context).pop();
          }
        });
      },
      child: Stack(
        children: [
          AnimatedBuilder(
            animation: _colorAnimation,
            builder: (context, child) {
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(
                      _colorAnimation.value,
                      0,
                      0,
                      0,
                    ),
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      widget.text,
                      style: TextStyle(
                        fontFamily: "Roboto Condensed",
                        fontWeight: FontWeight.normal,
                        fontSize: widget.fontSize,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ]
      ),
    );
  }
}