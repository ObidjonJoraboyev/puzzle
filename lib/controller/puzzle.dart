import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/models/puzzle.dart';

class PuzzleController extends GetxController {
  RxBool check = false.obs;
  RxList<PuzzleModel> list = [
    PuzzleModel(number: 1, visibility: true, color: Colors.blueGrey),
    PuzzleModel(number: 2, visibility: true, color: Colors.blueGrey),
    PuzzleModel(number: 3, visibility: true, color: Colors.blueGrey),
    PuzzleModel(number: 4, visibility: true, color: Colors.blueGrey),
    PuzzleModel(number: 5, visibility: true, color: Colors.blueGrey),
    PuzzleModel(number: 6, visibility: true, color: Colors.blueGrey),
    PuzzleModel(number: 7, visibility: true, color: Colors.blueGrey),
    PuzzleModel(number: 8, visibility: true, color: Colors.blueGrey),
    PuzzleModel(number: 9, visibility: true, color: Colors.blueGrey),
    PuzzleModel(number: 10, visibility: true, color: Colors.blueGrey),
    PuzzleModel(number: 11, visibility: true, color: Colors.blueGrey),
    PuzzleModel(number: 12, visibility: true, color: Colors.blueGrey),
    PuzzleModel(number: 13, visibility: true, color: Colors.blueGrey),
    PuzzleModel(number: 14, visibility: true, color: Colors.blueGrey),
    PuzzleModel(number: 0, visibility: false, color: Colors.transparent),
    PuzzleModel(number: 15, visibility: true, color: Colors.blueGrey),
  ].obs;
  RxList<PuzzleModel> tempList = [
    PuzzleModel(number: 1, visibility: true, color: Colors.blueGrey),
    PuzzleModel(number: 2, visibility: true, color: Colors.blueGrey),
    PuzzleModel(number: 3, visibility: true, color: Colors.blueGrey),
    PuzzleModel(number: 4, visibility: true, color: Colors.blueGrey),
    PuzzleModel(number: 5, visibility: true, color: Colors.blueGrey),
    PuzzleModel(number: 6, visibility: true, color: Colors.blueGrey),
    PuzzleModel(number: 7, visibility: true, color: Colors.blueGrey),
    PuzzleModel(number: 8, visibility: true, color: Colors.blueGrey),
    PuzzleModel(number: 9, visibility: true, color: Colors.blueGrey),
    PuzzleModel(number: 10, visibility: true, color: Colors.blueGrey),
    PuzzleModel(number: 11, visibility: true, color: Colors.blueGrey),
    PuzzleModel(number: 12, visibility: true, color: Colors.blueGrey),
    PuzzleModel(number: 13, visibility: true, color: Colors.blueGrey),
    PuzzleModel(number: 14, visibility: true, color: Colors.blueGrey),
    PuzzleModel(number: 15, visibility: true, color: Colors.blueGrey),
    PuzzleModel(number: 0, visibility: false, color: Colors.transparent),
  ].obs;

  RxInt movies = 0.obs;

  addMovie() => movies++;

  deleteMovie() => movies.value = 0;

  shuffleList() {
    list.shuffle();
  }

  bool canRun({required int futureIndex, required int nulIndex}) {
    switch (futureIndex) {
      case 0:
        {
          if (nulIndex == 1 || nulIndex == 4) {
            return true;
          } else {
            return false;
          }
        }
      case 1:
        {
          if (nulIndex == 0 || nulIndex == 2 || nulIndex == 5) {
            return true;
          } else {
            return false;
          }
        }
      case 2:
        {
          if (nulIndex == 1 || nulIndex == 3 || nulIndex == 6) {
            return true;
          } else {
            return false;
          }
        }
      case 3:
        {
          if (nulIndex == 2 || nulIndex == 7) {
            return true;
          } else {
            return false;
          }
        }
      case 4:
        {
          if (nulIndex == 0 || nulIndex == 8 || nulIndex == 5) {
            return true;
          } else {
            return false;
          }
        }
      case 5:
        {
          if (nulIndex == 1 ||
              nulIndex == 9 ||
              nulIndex == 4 ||
              nulIndex == 6) {
            return true;
          } else {
            return false;
          }
        }
      case 6:
        {
          if (nulIndex == 2 ||
              nulIndex == 10 ||
              nulIndex == 5 ||
              nulIndex == 7) {
            return true;
          } else {
            return false;
          }
        }
      case 7:
        {
          if (nulIndex == 6 || nulIndex == 3 || nulIndex == 11) {
            return true;
          } else {
            return false;
          }
        }
      case 8:
        {
          if (nulIndex == 4 || nulIndex == 12 || nulIndex == 9) {
            return true;
          } else {
            return false;
          }
        }
      case 9:
        {
          if (nulIndex == 8 ||
              nulIndex == 10 ||
              nulIndex == 13 ||
              nulIndex == 5) {
            return true;
          } else {
            return false;
          }
        }
      case 10:
        {
          if (nulIndex == 9 ||
              nulIndex == 11 ||
              nulIndex == 14 ||
              nulIndex == 6) {
            return true;
          } else {
            return false;
          }
        }
      case 11:
        {
          if (nulIndex == 10 || nulIndex == 7 || nulIndex == 15) {
            return true;
          } else {
            return false;
          }
        }
      case 12:
        {
          if (nulIndex == 8 || nulIndex == 13) {
            return true;
          } else {
            return false;
          }
        }
      case 13:
        {
          if (nulIndex == 12 || nulIndex == 14 || nulIndex == 9) {
            return true;
          } else {
            return false;
          }
        }
      case 14:
        {
          if (nulIndex == 13 || nulIndex == 15 || nulIndex == 10) {
            return true;
          } else {
            return false;
          }
        }
      case 15:
        {
          if (nulIndex == 14 || nulIndex == 11) {
            return true;
          } else {
            return false;
          }
        }
      default:
        return false;
    }
  }
}
