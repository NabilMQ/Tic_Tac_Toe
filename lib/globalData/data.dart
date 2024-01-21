import 'package:flutter/material.dart';

class BoardData with ChangeNotifier {
  late List <List <int> > board;
  set setAllBoard(int blank) {
    board = List.generate(3, (row) =>  List.generate(3, (col) => blank));
    notifyListeners();
  }

  void newGame() {
    board = List.generate(3, (row) =>  List.generate(3, (col) => 0));
    numberTurn.value = 1;
    completed.value = false;
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
    print(board);
    if (isSame(board[0][0], board[1][1], board[2][2]) && board[0][0] != 0) {
      print("diagonal\n");
      completed.value = true;
      setWinner = numberTurn.value;
    }
    
    if (isSame(board[0][2], board[1][1], board[2][0]) && board[0][2] != 0) {
      print("diagonal\n");
      completed.value = true;
      setWinner = numberTurn.value;
    }

    for (int i = 0; i < 3; i++) {
      if (isSame(board[i][0], board[i][1], board[i][2]) && board[i][0] != 0) {
        print("row\n");
        completed.value = true;
        setWinner = numberTurn.value;
        break;
      }

      if (isSame(board[0][i], board[1][i], board[2][i]) && board[0][i] != 0) {
        print("column\n");
        completed.value = true;
        setWinner = numberTurn.value;
        break;
      }
    }

    if (isFull()) {
      print("draw\n");
      draw.value = true;
    }
  }
}

BoardData game = BoardData();

ValueNotifier numberTurn = ValueNotifier <int> (1);
ValueNotifier completed = ValueNotifier <bool> (false);
ValueNotifier isPVC = ValueNotifier <bool> (false);
ValueNotifier isPVP = ValueNotifier <bool> (false);
ValueNotifier turn = ValueNotifier <String> ("Your Turn");
ValueNotifier winner = ValueNotifier <String> ("You");
ValueNotifier draw = ValueNotifier <bool> (false);

String oShape = "assets/svg/o_shape.svg";
String xShape = "assets/svg/x_shape.svg";

void setGame(String game) {
  if (game == "PVC") {
    isPVC.value = true;
  }
  else if (game == "PVP") {
    isPVP.value = true;
  }
}

void setPVCTurn(int number) {
  if (number % 2 == 1) {
    turn.value = "Your Turn";
  }
  else {
    turn.value = "Computer Turn";
  }
}

void setPVPTurn(int number) {
  if (number % 2 == 1) {
    turn.value = "Player 1 Turn";
  }
  else {
    turn.value = "Player 2 Turn";
  }
}

set setWinner(int number) {
  if (isPVC.value) {
    if ((number - 1) % 2 == 1) {
      winner.value = "You";
    }
    else {
      winner.value = "Computer";
    }
  }
  else {
    if ((number - 1) % 2 == 1) {
      winner.value = "Player 1";
    }
    else {
      winner.value = "Player 2";
    }
  }
}

bool isSame(int firstBlock, int secondBlock, int thirdBlock) {
  if (firstBlock == secondBlock && firstBlock == thirdBlock && secondBlock == thirdBlock) {
    return true;
  }
  return false;
}

bool isFull() {
  print(game.board);
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (game.board[i][j] == 0) {
        return false;
      }
    }
  }

  return true;
}

bool whoseTurn(int number) {
  if (number % 2 == 0) {
    return true;
  }
  return false;
}