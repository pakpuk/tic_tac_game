import 'package:flutter/material.dart';
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
          SizedBox(height: 16),
          Text(
            "Current Player: $activateplayer".toUpperCase(),
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: ColorManager.whiteColor,
                ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Text(
            result,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: ColorManager.whiteColor,
                ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          ElevatedButton.icon(
            onPressed: () {},
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
}
