import 'package:flutter/material.dart';
import '../controllers/history_controller.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  final controller = HistoryController();

  Color getSubjectColor(String title) {
    if (title.contains("Toán")) return Colors.orange;
    if (title.contains("Anh")) return Colors.amber;
    if (title.contains("Vật Lý")) return Colors.green;
    if (title.contains("Sinh")) return Colors.cyan;
    return Colors.blue;
  }

  IconData getSubjectIcon(String title) {
    if (title.contains("Toán")) return Icons.calculate;
    if (title.contains("Anh")) return Icons.language;
    if (title.contains("Vật Lý")) return Icons.science;
    if (title.contains("Sinh")) return Icons.biotech;
    return Icons.quiz;
  }

  @override
  Widget build(BuildContext context) {
    final histories = controller.getHistories();

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6), // Light gray background
      appBar: AppBar(
        backgroundColor: const Color(0xFF2563EB), // Vibrant Blue
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Lịch sử làm bài",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.emoji_events_outlined, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.menu_book_outlined, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person_outline, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: histories.isEmpty
          ? const Center(
              child: Text(
                "Chưa bài làm nào được hoàn thành",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              itemCount: histories.length,
              itemBuilder: (context, index) {
                final h = histories[index];
                final subjectColor = getSubjectColor(h.title);

                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // Subject Icon Container
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: subjectColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          getSubjectIcon(h.title),
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Content
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              h.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  size: 14,
                                  color: Colors.amber,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  "${h.score}",
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.black54,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  h.date,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Score and Button
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "${h.score} / ${h.total}",
                            style: const TextStyle(
                              color: Color(0xFF2563EB),
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            height: 30,
                            child: ElevatedButton(
                              onPressed: () {
                                // Navigate to details
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF2563EB),
                                foregroundColor: Colors.white,
                                elevation: 0,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                "Chi tiết",
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
