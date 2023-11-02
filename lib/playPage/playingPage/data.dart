import 'package:flutter/material.dart';

class Turn extends ChangeNotifier {
  late List <List <int> > _board;
  int numberTurn = 1;
  bool completed = false;
  String oShape = "assets/svg/o_shape.svg";
  String xShape = "assets/svg/x_shape.svg";
  bool _isPVC = false;
  bool _isPVP = false;
  String game = "Your Turn";

  List <List <int> > get board => _board;
  bool get pvc => _isPVC;
  bool get pvp => _isPVP;

  set setAllBoard(int blank) {
    _board = List.generate(3, (row) =>  List.generate(3, (col) => blank));
    notifyListeners();
  }

  set setGame(String game) {
    if (game == "PVC") {
      _isPVC = true;
    }
    else if (game == "PVP") {
      _isPVP = true;
    }

    notifyListeners();
  }

  set setPVCTurn(int numberTurn) {
    if (numberTurn % 2 == 1) {
      game = "Your Turn";
    }
    else {
      game = "Computer Turn";
    }

    notifyListeners();
  }

  set setPVPTurn(int numberTurn) {
    if (numberTurn % 2 == 1) {
      game = "Player 1 Turn";
    }
    else {
      game = "Player 2 Turn";
    }

    notifyListeners();
  }

  void setBoard(int row, int column, int value) {
    board[row][column] = value;
    notifyListeners();
  }

  bool isSame(int firstBlock, int secondBlock, int thirdBlock) {
    if (firstBlock == secondBlock && firstBlock == thirdBlock && secondBlock == thirdBlock) {
      return true;
    }
    return false;
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
    if (isSame(board[0][0], board[1][1], board[2][2]) && board[0][0] != 0) {
      print("diagonal\n");
      completed = true;
      notifyListeners();
    }
    
    if (isSame(board[0][2], board[1][1], board[2][0]) && board[0][2] != 0) {
      print("diagonal\n");
      completed = true;
      notifyListeners();
    }

    for (int i = 0; i < 3; i++) {
      if (isSame(board[i][0], board[i][1], board[i][2]) && board[i][0] != 0) {
        print("row\n");
        completed = true;
        notifyListeners();
        break;
      }

      if (isSame(board[0][i], board[1][i], board[2][i]) && board[0][i] != 0) {
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

  void newGame() {
    _board = List.generate(3, (row) =>  List.generate(3, (col) => 0));
    numberTurn = 1;
    completed = false;
  }
}