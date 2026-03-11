import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../models/history_model.dart';
import '../models/leaderboard_model.dart';

class FakeDB {
  static List<UserModel> users = [
    UserModel(email: "admin@gmail.com", password: "123456"),
  ];
  static List<HistoryModel> histories = [
    HistoryModel(
      title: "Toán Cơ Bản",
      score: 8,
      total: 10,
      date: "12/03/2022",
    ),
    HistoryModel(
      title: "Ngữ Pháp Tiếng Anh",
      score: 7,
      total: 10,
      date: "10/03/2022",
    ),
    HistoryModel(
      title: "Vật Lý Lớp 10",
      score: 9,
      total: 10,
      date: "08/03/2022",
    ),
  ];

  static List<LeaderboardEntry> leaderboard = [
    LeaderboardEntry(rank: 1, name: "Minh Nguyễn", score: 2850, quizCount: 45, avatarColor: const Color(0xFF6C63FF)),
    LeaderboardEntry(rank: 2, name: "Thảo Trần", score: 2720, quizCount: 42, avatarColor: const Color(0xFFFF6B6B)),
    LeaderboardEntry(rank: 3, name: "Hùng Lê", score: 2580, quizCount: 38, avatarColor: const Color(0xFF4ECDC4)),
    LeaderboardEntry(rank: 4, name: "Linh Phạm", score: 2430, quizCount: 36, avatarColor: const Color(0xFFFFE66D)),
    LeaderboardEntry(rank: 5, name: "Đức Hoàng", score: 2310, quizCount: 34, avatarColor: const Color(0xFFA8E6CF)),
    LeaderboardEntry(rank: 6, name: "Hà Vũ", score: 2150, quizCount: 30, avatarColor: const Color(0xFFFF8A5C)),
    LeaderboardEntry(rank: 7, name: "Tuấn Đỗ", score: 1980, quizCount: 28, avatarColor: const Color(0xFF88D8B0)),
    LeaderboardEntry(rank: 8, name: "Mai Ngô", score: 1850, quizCount: 25, avatarColor: const Color(0xFFCDB4DB)),
    LeaderboardEntry(rank: 9, name: "Khoa Bùi", score: 1720, quizCount: 22, avatarColor: const Color(0xFFFFC8DD)),
    LeaderboardEntry(rank: 10, name: "Yến Lý", score: 1590, quizCount: 20, avatarColor: const Color(0xFFBDE0FE)),
  ];
}
