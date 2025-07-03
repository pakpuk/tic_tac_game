class Game {
  void playGame(int index, String activateplayer) {
    if (activateplayer == "X") {
      Player.playerX.add(index);
    } else {
      Player.palyerO.add(index);
    }
  }

  void checkWinner() {}
  void autoplay() {}
}

class Player {
  static const x = "X";
  static const o = "O";
  static const empty = "";
  static const List<int> playerX = [];
  static const List<int> palyerO = [];
}
