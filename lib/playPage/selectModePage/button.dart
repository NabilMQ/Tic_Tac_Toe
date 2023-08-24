import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({ 
    Key? key,
    required this.text,
    required this.icon,
    this.route,
    this.isPop = false,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final Function? route;
  final bool isPop;

  @override
  State <Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> with TickerProviderStateMixin {

  late AnimationController _controllerColor;
  late Animation <int> _colorAnimation;
  bool clicked = false;

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
        if (!clicked) {
          clicked = true;
          _controllerColor.forward();
          Future.delayed(const Duration(milliseconds: 250), () {
            _controllerColor.reverse();
          });

          Future.delayed(const Duration(milliseconds: 250), () {
            if (widget.route != null) {
              widget.route!.call();
              clicked = false;
            }
            
            if (widget.isPop) {
              Navigator.of(context).pop();
            }
          });
        }
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
              );
            },
          ),

          Column(
            children: [

              const Expanded(
                flex: 4,
                child: SizedBox.expand(),
              ),

              Expanded(
                flex: 5,
                child: SizedBox.expand(
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Center(
                      child: Icon(
                        widget.icon,
                      ),
                    ),
                  ),
                ),
              ),

              Expanded(
                flex: 5,
                child: SizedBox.expand(
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 1,
                        child: SizedBox.expand(),
                      ),
                      Expanded(
                        flex: 6,
                        child: Center(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              widget.text,
                              style: const TextStyle(
                                fontFamily: "Roboto Condensed",
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                letterSpacing: 0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 1,
                        child: SizedBox.expand(),
                      ),
                    ]
                  ),
                ),
              ),

              const Expanded(
                flex: 2,
                child: SizedBox.expand(),
              ),

            ],
          ),
        ]
      ),
    );
  }
}