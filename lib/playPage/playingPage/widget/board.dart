import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tic_tac_toe/playPage/playingPage/data.dart';

class Board extends StatefulWidget {
  const Board({ 
    Key? key,
    required this.data,
  }) : super(key: key);

  final Turn data;

  @override
  State <Board> createState() => _BoardState();
}

class _BoardState extends State <Board> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 7.5,
      crossAxisSpacing: 7.5,
      children: List.generate(9, (index) {
        return AspectRatio(
          aspectRatio: 1.0 / 1.0,
          child: GestureDetector(
            onTap: () {
              if (widget.data.isClicked(index ~/ 3, index % 3) == false) {
                if (widget.data.numberTurn % 2 == 1) {
                  widget.data.setBoard(index ~/ 3, index % 3, 1);
                }
                else {
                  widget.data.setBoard(index ~/ 3, index % 3, 2);
                }
                widget.data.checkBoard();
                widget.data.numberTurn++;
              }
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: AnimatedScale(
                scale: widget.data.board[index ~/ 3][index % 3] != 0 ? 1.0 : 0.0,
                curve: Curves.easeOutExpo,
                duration: const Duration(milliseconds: 500),
                child: SvgPicture.asset(
                  widget.data.board[index ~/ 3][index % 3] % 2 == 1 ? widget.data.oShape : widget.data.xShape, 
                ),
              )
            ),
          ),
        );
      }),
    );
  }
}