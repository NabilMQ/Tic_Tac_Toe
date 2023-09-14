import 'package:flutter/material.dart';

class Turn extends ChangeNotifier {
  late List <List <int> > _board;

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

  void checkBoard() {
    if (board[0][0] == board[1][1] && board[1][1] == board[2][2]) {
      print("diagonal\n");
    }
    
    if (board[0][2] == board[1][1] && board[1][1] == board[2][0]) {
      print("diagonal\n");
    }

    for (int i = 0; i < 3; i++) {
      if (board[i][0] == board[i][1] && board[i][i] == board[i][2]) {
        print("row\n");
        break;
      }

      if (board[0][i] == board[1][i] && board[1][i] == board[2][i]) {
        print("column\n");
        break;
      }
    }

    notifyListeners();
  }

}