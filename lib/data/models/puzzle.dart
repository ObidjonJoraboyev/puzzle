import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class PuzzleModel extends Equatable {
  final int number;
  final bool visibility;
  final Color color;

  PuzzleModel({
    required this.color,
    required this.number,
    required this.visibility,
  });

  PuzzleModel copyWith({bool? visibility, int? number, Color? color}) {
    return PuzzleModel(
        color: color ?? this.color,
        number: number ?? this.number,
        visibility: visibility ?? this.visibility);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [number, visibility, color];
}
