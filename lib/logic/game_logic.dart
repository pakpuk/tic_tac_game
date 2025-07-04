import 'dart:math';

class Game {
  void playGame(int index, String activateplayer) {
    if (activateplayer == "X") {
      Player.playerX.add(index);
    } else {
      Player.playerO.add(index);
    }
  }

  String checkWinner() {
    String winner = "";
    if (Player.playerX.containsAll(0, 1, 2) ||
        Player.playerX.containsAll(3, 4, 5) ||
        Player.playerX.containsAll(6, 7, 8) ||
        Player.playerX.containsAll(0, 3, 6) ||
        Player.playerX.containsAll(1, 4, 7) ||
        Player.playerX.containsAll(2, 5, 8) ||
        Player.playerX.containsAll(0, 4, 8) ||
        Player.playerX.containsAll(2, 4, 6)) {
      return winner = "X ";
    } else if (Player.playerO.containsAll(0, 1, 2) ||
        Player.playerO.containsAll(3, 4, 5) ||
        Player.playerO.containsAll(6, 7, 8) ||
        Player.playerO.containsAll(0, 3, 6) ||
        Player.playerO.containsAll(1, 4, 7) ||
        Player.playerO.containsAll(2, 5, 8) ||
        Player.playerO.containsAll(0, 4, 8) ||
        Player.playerO.containsAll(2, 4, 6)) {
      return winner = "O ";
    } else {
      return winner = "";
    }
  }

  Future<void> autoplay(activateplayer) async {
    int index = 0;
    List<int> availableMoves = List.generate(9, (i) => i)
        .where(
            (i) => !Player.playerX.contains(i) && !Player.playerO.contains(i))
        .toList();
    if (Player.playerX.containsAll(0, 1) && availableMoves.contains(2)) {
      index = 2;
    } else if (Player.playerX.containsAll(1, 2) && availableMoves.contains(0)) {
      index = 0;
    } else if (Player.playerX.containsAll(0, 2) && availableMoves.contains(1)) {
      index = 1;
    } else if (Player.playerX.containsAll(3, 4) && availableMoves.contains(5)) {
      index = 5;
    } else if (Player.playerX.containsAll(4, 5) && availableMoves.contains(3)) {
      index = 3;
    } else if (Player.playerX.containsAll(3, 5) && availableMoves.contains(4)) {
      index = 4;
    } else if (Player.playerX.containsAll(6, 7) && availableMoves.contains(8)) {
      index = 8;
    } else if (Player.playerX.containsAll(7, 8) && availableMoves.contains(6)) {
      index = 6;
    } else if (Player.playerX.containsAll(6, 8) && availableMoves.contains(7)) {
      index = 7;
    } else if (Player.playerX.containsAll(0, 3) && availableMoves.contains(6)) {
      index = 6;
    } else if (Player.playerX.containsAll(3, 6) && availableMoves.contains(0)) {
      index = 0;
    } else if (Player.playerX.containsAll(0, 6) && availableMoves.contains(3)) {
      index = 3;
    } else if (Player.playerX.containsAll(1, 4) && availableMoves.contains(7)) {
      index = 7;
    } else if (Player.playerX.containsAll(4, 7) && availableMoves.contains(1)) {
      index = 1;
    } else if (Player.playerX.containsAll(1, 7) && availableMoves.contains(4)) {
      index = 4;
    } else if (Player.playerX.containsAll(2, 5) && availableMoves.contains(8)) {
      index = 8;
    } else if (Player.playerX.containsAll(5, 8) && availableMoves.contains(2)) {
      index = 2;
    } else if (Player.playerX.containsAll(2, 8) && availableMoves.contains(5)) {
      index = 5;
    } else if (Player.playerX.containsAll(0, 4) && availableMoves.contains(8)) {
      index = 8;
    } else if (Player.playerX.containsAll(4, 8) && availableMoves.contains(0)) {
      index = 0;
    } else if (Player.playerX.containsAll(0, 8) && availableMoves.contains(4)) {
      index = 4;
    } else if (Player.playerX.containsAll(2, 4) && availableMoves.contains(6)) {
      index = 6;
    } else if (Player.playerX.containsAll(4, 6) && availableMoves.contains(2)) {
      index = 2;
    } else if (Player.playerX.containsAll(2, 6) && availableMoves.contains(4)) {
      index = 4;
    } else if (Player.playerO.containsAll(0, 1) && availableMoves.contains(2)) {
      index = 2;
    } else if (Player.playerO.containsAll(1, 2) && availableMoves.contains(0)) {
      index = 0;
    } else if (Player.playerO.containsAll(0, 2) && availableMoves.contains(1)) {
      index = 1;
    } else if (Player.playerO.containsAll(3, 4) && availableMoves.contains(5)) {
      index = 5;
    } else if (Player.playerO.containsAll(4, 5) && availableMoves.contains(3)) {
      index = 3;
    } else if (Player.playerO.containsAll(3, 5) && availableMoves.contains(4)) {
      index = 4;
    } else if (Player.playerO.containsAll(6, 7) && availableMoves.contains(8)) {
      index = 8;
    } else if (Player.playerO.containsAll(7, 8) && availableMoves.contains(6)) {
      index = 6;
    } else if (Player.playerO.containsAll(6, 8) && availableMoves.contains(7)) {
      index = 7;
    } else if (Player.playerO.containsAll(0, 3) && availableMoves.contains(6)) {
      index = 6;
    } else if (Player.playerO.containsAll(3, 6) && availableMoves.contains(0)) {
      index = 0;
    } else if (Player.playerO.containsAll(0, 6) && availableMoves.contains(3)) {
      index = 3;
    } else if (Player.playerO.containsAll(1, 4) && availableMoves.contains(7)) {
      index = 7;
    } else if (Player.playerO.containsAll(4, 7) && availableMoves.contains(1)) {
      index = 1;
    } else if (Player.playerO.containsAll(1, 7) && availableMoves.contains(4)) {
      index = 4;
    } else if (Player.playerO.containsAll(2, 5) && availableMoves.contains(8)) {
      index = 8;
    } else if (Player.playerO.containsAll(5, 8) && availableMoves.contains(2)) {
      index = 2;
    } else if (Player.playerO.containsAll(2, 8) && availableMoves.contains(5)) {
      index = 5;
    } else if (Player.playerO.containsAll(0, 4) && availableMoves.contains(8)) {
      index = 8;
    } else if (Player.playerO.containsAll(4, 8) && availableMoves.contains(0)) {
      index = 0;
    } else if (Player.playerO.containsAll(0, 8) && availableMoves.contains(4)) {
      index = 4;
    } else if (Player.playerO.containsAll(2, 4) && availableMoves.contains(6)) {
      index = 6;
    } else if (Player.playerO.containsAll(4, 6) && availableMoves.contains(2)) {
      index = 2;
    } else if (Player.playerO.containsAll(2, 6) && availableMoves.contains(4)) {
      index = 4;
    } else {
      Random random = Random();
      int randomIndex = random.nextInt(availableMoves.length);
      index = availableMoves[randomIndex];
    }
    Random random = Random();
    int randomIndex = random.nextInt(availableMoves.length);
    index = availableMoves[randomIndex];
    playGame(index, activateplayer);
  }
}

extension ContainsAll on List {
  containsAll(int x, int y, [z]) {
    if (z != null) {
      return contains(x) && contains(y) && contains(z);
    } else {
      return contains(x) && contains(y);
    }
  }
}

class Player {
  static const x = "X";
  static const o = "O";
  static const empty = "";
  static const List<int> playerX = [];
  static const List<int> playerO = [];
}
