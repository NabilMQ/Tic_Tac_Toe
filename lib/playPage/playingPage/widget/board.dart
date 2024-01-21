import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tic_tac_toe/globalData/audio.dart';
import 'package:tic_tac_toe/globalData/data.dart';


class Board extends StatefulWidget {
  const Board({ 
    super.key,
  });

  @override
  State <Board> createState() => _BoardState();
}

class _BoardState extends State <Board> {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: game,
      builder: (context, child) {
        return GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 7.5,
          crossAxisSpacing: 7.5,
          children: List.generate(9, (index) {
            return AspectRatio(
              aspectRatio: 1.0 / 1.0,
              child: GestureDetector(
                onTap: () async {
                  playClickSound();
                  numberTurn.value++;
                  if (game.isClicked(index ~/ 3, index % 3) == false) {
                    if (numberTurn.value % 2 == 1) {
                      game.setBoard(index ~/ 3, index % 3, 1);
                      isPVC.value ? setPVCTurn(numberTurn.value) : setPVPTurn(numberTurn.value);
                    }
                    else {
                      game.setBoard(index ~/ 3, index % 3, 2);
                      isPVC.value ? setPVCTurn(numberTurn.value) : setPVPTurn(numberTurn.value);
                    }
                    game.checkBoard();
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: AnimatedScale(
                    scale: game.board[index ~/ 3][index % 3] != 0 ? 1.0 : 0.0,
                    curve: Curves.easeOutExpo,
                    duration: const Duration(milliseconds: 500),
                    child: SvgPicture.asset(
                      game.board[index ~/ 3][index % 3] % 2 == 1 ? oShape : xShape, 
                    ),
                  )
                ),
              ),
            );
          }),
        );
      },
    );
  }
}