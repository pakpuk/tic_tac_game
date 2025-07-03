import 'dart:math';

class Game {
  void playGame(int index, String activateplayer) {
    if (activateplayer == "X") {
      Player.playerX.add(index);
    } else {
      Player.playerO.add(index);
    }
  }

  void checkWinner() {}
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

class Player {
  static const x = "X";
  static const o = "O";
  static const empty = "";
  static const List<int> playerX = [];
  static const List<int> playerO = [];
}
