import 'package:flutter/material.dart';
import '../models/quiz_model.dart';
import '../models/question_model.dart';

class HistoryDetailView extends StatelessWidget {
  final Quiz quiz;
  final List<int?> userAnswers;

  const HistoryDetailView({
    super.key,
    required this.quiz,
    required this.userAnswers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: const Text(
          "Chi tiết kết quả",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: quiz.questions.length,
        itemBuilder: (context, index) {
          Question q = quiz.questions[index];
          int? userAnswer = userAnswers[index];
          bool isCorrect = userAnswer == q.correctAnswerIndex;

          return Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Câu ${index + 1}: ${q.questionText}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                _answerBox(
                  "Đáp án của bạn:",
                  q.options[userAnswer ?? 0],
                  isCorrect ? Colors.green : Colors.red,
                  userAnswer == null ? Icons.help_outline : (isCorrect ? Icons.check_circle : Icons.cancel),
                ),
                if (!isCorrect) ...[
                  const SizedBox(height: 12),
                  _answerBox(
                    "Đáp án đúng:",
                    q.options[q.correctAnswerIndex],
                    Colors.green,
                    Icons.check_circle,
                  ),
                ],
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                "Làm lại",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                side: const BorderSide(color: Colors.blue, width: 2),
              ),
              child: const Text(
                "Về trang chủ",
                style: TextStyle(color: Colors.blue, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _answerBox(String label, String text, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(fontSize: 12, color: color),
                ),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
