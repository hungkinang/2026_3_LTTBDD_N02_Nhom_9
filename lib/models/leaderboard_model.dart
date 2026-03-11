import 'package:flutter/material.dart';

class LeaderboardEntry {
  int rank;
  String name;
  int score;
  int quizCount;
  Color avatarColor;

  LeaderboardEntry({
    required this.rank,
    required this.name,
    required this.score,
    required this.quizCount,
    required this.avatarColor,
  });
}
