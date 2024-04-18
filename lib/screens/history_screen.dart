import 'package:flutter/material.dart';
import 'package:puzzle15/data/local/local_database/local_database.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<GameData> list = [];

  @override
  void initState() {
    init();
    setState(() {});
    super.initState();
  }

  init() async {
    list = await LocalDatabase.getAllGameData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
      ),
      body: Center(
        child: Column(
          children: [
            ...List.generate(
              list.length,
              (index) => Column(
                children: [
                  ListTile(
                    onLongPress: () {
                      LocalDatabase.delete(list[index].id!);
                      init();
                    },
                    title: Text("Movies ${list[index].moves}"),
                  ),
                  Container(
                    width: double.infinity,
                    height: 0.4,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
