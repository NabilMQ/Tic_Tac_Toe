import 'package:flutter/material.dart';

class Turn extends ChangeNotifier {
  late List <List <int> > _board;
  int numberTurn = 1;
  bool completed = false;
  String oShape = "assets/svg/o_shape.svg";
  String xShape = "assets/svg/x_shape.svg";

  List <List <int> > get board => _board;

  set setAllBoard(int blank) {
    _board = List.generate(3, (row) =>  List.generate(3, (col) => blank));
    notifyListeners();
  }

  void setBoard(int row, int column, int value) {
    board[row][column] = value;
    notifyListeners();
  }

  bool isClicked(int row, int column) {
    if (board[row][column] != 0) {
      notifyListeners();
      return true;
    }
    notifyListeners();
    return false;
  }
  // be careful with Another exception was thrown: setState() or markNeedsBuild() called during build.

  void checkBoard() {
    print(board);
    if (board[0][0] == board[1][1] && board[1][1] == board[2][2] && board[0][0] != 0) {
      print("diagonal\n");
      completed = true;
      notifyListeners();
    }
    
    if (board[0][2] == board[1][1] && board[1][1] == board[2][0] && board[0][2] != 0) {
      print("diagonal\n");
      completed = true;
      notifyListeners();
    }

    for (int i = 0; i < 3; i++) {
      if (board[i][0] == board[i][1] && board[i][i] == board[i][2] && board[i][0] != 0) {
        print("row\n");
        completed = true;
        notifyListeners();
        break;
      }

      if (board[0][i] == board[1][i] && board[1][i] == board[2][i] && board[0][i] != 0) {
        print("column\n");
        completed = true;
        notifyListeners();
        break;
      }
    }
  }

  bool whoseTurn(int number) {
    if (number % 2 == 0) {
      notifyListeners();
      return true;
    }
    notifyListeners();
    return false;
  }
}