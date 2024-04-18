import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puzzle15/controller/puzzle.dart';
import 'package:puzzle15/data/local/local_database/local_database.dart';
import 'package:puzzle15/util/global_button.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.put(PuzzleController()..shuffleList());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    title: const Text("Do you want to end the game?"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Cancel",
                            style: TextStyle(color: Colors.black),
                          )),
                      TextButton(
                        onPressed: () {
                          controller.shuffleList();
                          controller.deleteMovie();
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "End",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.arrow_back_ios)),
        elevation: 1,
        title: const Text("Puzzle"),
      ),
      body: Obx(
        () => Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Movies:",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                Text(
                  controller.movies.toString(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Wrap(
                children: [
                  ...List.generate(
                    controller.list.length,
                    (index) {
                      return GestureDetector(
                        onTap: controller.list[index].visibility == true
                            ? () async {
                                int nulIndex = 0;
                                for (int i = 0;
                                    i < controller.list.length;
                                    i++) {
                                  if (controller.list[i].visibility == false) {
                                    nulIndex = i;
                                  }
                                }

                                if (controller.canRun(
                                    futureIndex: index, nulIndex: nulIndex)) {
                                  controller.addMovie();
                                  int a = controller.list[index].number;

                                  for (int i = 0;
                                      i < controller.list.length;
                                      i++) {
                                    if (controller.list[i].visibility ==
                                        false) {
                                      controller.list[i] = controller.list[i]
                                          .copyWith(
                                              visibility: true,
                                              color: Colors.blueGrey,
                                              number: a);
                                      controller.list[index] =
                                          controller.list[index].copyWith(
                                        visibility: false,
                                        color: Colors.white,
                                        number: 0,
                                      );
                                    }
                                  }
                                }
                              }
                            : () {},
                        child: Container(
                          width: 100,
                          height: 100,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 2, vertical: 2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: controller.list[index].color),
                          child: Center(
                            child: Text(
                              controller.list[index].number.toString(),
                              style: const TextStyle(
                                  fontSize: 42, color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GlobalButton(
                    color: Colors.grey,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: const Text("Do you want to restart?"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    "Cancel",
                                    style: TextStyle(color: Colors.black),
                                  )),
                              TextButton(
                                onPressed: () {
                                  controller.shuffleList();
                                  controller.deleteMovie();
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "Restart",
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    subtitle: const Text(
                      "Restart",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    )),
                GlobalButton(
                    color: Colors.red,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: const Text("Do you want to end the game?"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    "Cancel",
                                    style: TextStyle(color: Colors.black),
                                  )),
                              TextButton(
                                onPressed: () {

                                  LocalDatabase.saveGameData(GameData(moves: controller.movies.value, timer: DateTime.now().toString()));


                                  for (int i = 0;
                                      i < controller.list.length;
                                      i++) {
                                    if (controller.list.last.visibility ==
                                            false &&
                                        controller.list[i].number == i + 1) {
                                      controller.check.value = true;
                                    }
                                    {
                                      controller.check.value = false;
                                      break;
                                    }
                                  }
                                  if (controller.check.value == true) {
                                    showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (context) {
                                          return const CupertinoAlertDialog(
                                            title: Text("YOU WIN"),
                                          );
                                        });
                                  } else {
                                    controller.shuffleList();
                                    controller.deleteMovie();
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  }
                                },
                                child: const Text(
                                  "End",
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    subtitle: const Text(
                      "   End   ",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
