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
