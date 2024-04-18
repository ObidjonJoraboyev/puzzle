import 'package:flutter/material.dart';
import 'package:puzzle15/screens/game_screen.dart';
import 'package:puzzle15/screens/history_screen.dart';
import 'package:puzzle15/util/global_button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: GlobalButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HomeScreen();
                        },
                      ),
                    );
                  },
                  subtitle: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Start Game   ",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                      FlutterLogo(
                        size: 24,
                      )
                    ],
                  ),
                  color: Colors.green),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 22),
              child: GlobalButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const HistoryScreen();
                        },
                      ),
                    );
                  },
                  subtitle: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "History   ",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                      FlutterLogo(
                        size: 24,
                      )
                    ],
                  ),
                  color: Colors.pinkAccent),
            ),
          ],
        ),
      ),
    );
  }
}
