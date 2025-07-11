import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tictac_game/logic/game_logic.dart';
import 'package:tictac_game/theme/color_manager.dart';
import 'package:tictac_game/theme/text_mnager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String activateplayer = " X";
  int turn = 0;
  String result = "";
  bool isGameOver = false;
  Game game = Game();
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: SafeArea(
          child: Column(
        children: [
          SwitchListTile.adaptive(
              title: Text(
                TextMnager.homeScreenTitle,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: ColorManager.whiteColor,
                    ),
                textAlign: TextAlign.center,
              ),
              value: isSwitched,
              onChanged: (bool newvalue) {
                setState(() {
                  isSwitched = newvalue;
                });
              }),
          SizedBox(height: 16.h),
          Text(
            "Current Player: $activateplayer".toUpperCase(),
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: ColorManager.whiteColor,
                ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h),
          Text(
            result,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: ColorManager.whiteColor,
                ),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(16),
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1.0,
              crossAxisCount: 3,
              children: List.generate(
                  9,
                  (index) => InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: isGameOver
                            ? null
                            : () {
                                _onTap(index);
                              },
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorManager.shadowColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                              child: Text(
                            Player.playerX.contains(index)
                                ? "X"
                                : Player.playerO.contains(index)
                                    ? "O"
                                    : Player.empty,
                            style: TextStyle(
                                fontSize: 42,
                                color: Player.playerX.contains(index)
                                    ? ColorManager.bluecolor
                                    : ColorManager.redColor),
                          )),
                        ),
                      )),
            ),
          ),
          SizedBox(height: 8.h),
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                Player.playerX.clear();
                Player.playerO.clear();
                activateplayer = "X";
                turn = 0;
                result = "";
                isGameOver = false;
              });
            },
            icon: Icon(
              Icons.replay,
              color: ColorManager.whiteColor,
            ),
            label: Text(TextMnager.replayButtonText,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: ColorManager.whiteColor,
                    )),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(ColorManager.splashColor),
            ),
          ),
        ],
      )),
    );
  }

  void _onTap(int index) async {
    if (!Player.playerX.contains(index) && Player.playerX.isEmpty ||
        !Player.playerO.contains(index) && Player.playerO.isEmpty) {
      game.playGame(index, activateplayer);
      _upadateState();
    }
    if (!isSwitched && !isGameOver && turn != 9) {
      await game.autoplay(activateplayer);
      _upadateState();
    }
  }

  void _upadateState() {
    return setState(() {
      if (activateplayer == Player.x) {
        activateplayer = Player.o;
      } else {
        activateplayer = Player.x;
      }
      turn++;
      String winner = game.checkWinner();
      if (winner.isNotEmpty) {
        result = "Winner is $winner";
        isGameOver = true;
      } else {
        result = "It's a Draw";
        isGameOver = true;
      }
    });
  }
}
