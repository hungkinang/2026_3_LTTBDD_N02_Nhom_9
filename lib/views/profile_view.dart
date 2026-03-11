import 'package:flutter/material.dart';
import '../controllers/history_controller.dart';
import 'history_view.dart';
import 'leaderboard_view.dart';
import 'login_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HistoryController();
    final totalQuiz = controller.totalQuizDone();
    final avgScore = controller
        .getAverageScore()
        .toStringAsFixed(1);

    return Scaffold(
      appBar: AppBar(title: const Text("Hồ sơ")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xff2F80ED), Color(0xff1C4FD7)],
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white24,
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Minh Nguyễn",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            "$totalQuiz",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            "Bài đã làm",
                            style: TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 40,
                        width: 1,
                        color: Colors.white30,
                      ),
                      Column(
                        children: [
                          Text(
                            avgScore,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            "Điểm trung bình",
                            style: TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            button("Lịch sử làm bài", Colors.blue, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const HistoryView(),
                ),
              );
            }),
            button(
              "Bảng xếp hạng",
              Colors.transparent,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const LeaderboardView(),
                  ),
                );
              },
              border: true,
            ),
            button("Tạo Quiz mới", Colors.green, () {}),
            button("Đăng xuất", Colors.grey.shade300, () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => const LoginView(),
                ),
                (route) => false,
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget button(
    String text,
    Color color,
    VoidCallback onTap, {
    bool border = false,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          elevation: 0,
          padding: const EdgeInsets.all(14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: border
                ? const BorderSide(color: Colors.blue)
                : BorderSide.none,
          ),
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
            color: border ? Colors.blue : Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
