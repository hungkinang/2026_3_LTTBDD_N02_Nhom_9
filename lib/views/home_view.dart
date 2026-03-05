import 'package:flutter/material.dart';
import '../models/quiz_model.dart';
import '../data/quiz_data.dart';
import 'quiz_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String _searchQuery = "";
  String _selectedCategory = "Tất cả";

  List<Quiz> get _filteredQuizzes {
    return QuizData.quizzes.where((quiz) {
      final matchesSearch = quiz.title.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesCategory = _selectedCategory == "Tất cả" || 
                             quiz.title.toLowerCase().contains(_selectedCategory.toLowerCase());
      return matchesSearch && matchesCategory;
    }).toList();
  }

  Widget quizItem(BuildContext context, Quiz quiz) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizView(quiz: quiz),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 6),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  quiz.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(quiz.info),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                quiz.level,
                style: const TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 50,
              left: 20,
              right: 20,
            ),
            height: 180,
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Quizzi",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.notifications_outlined, color: Colors.white),
                  ],
                ),
                const SizedBox(height: 20),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: "Tìm kiếm",
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _categoryIcon(Icons.grid_view, "Tất cả", Colors.grey),
                      const SizedBox(width: 15),
                      _categoryIcon(Icons.calculate, "Toán", Colors.orange),
                      const SizedBox(width: 15),
                      _categoryIcon(Icons.book, "Anh", Colors.blue),
                      const SizedBox(width: 15),
                      _categoryIcon(Icons.science, "Vật Lý", Colors.green),
                      const SizedBox(width: 15),
                      _categoryIcon(Icons.biotech, "Sinh Học", Colors.cyan),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _selectedCategory == "Tất cả" ? "Quiz Nổi Bật" : "Kết quả cho '$_selectedCategory'",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (_selectedCategory != "Tất cả")
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _selectedCategory = "Tất cả";
                          });
                        },
                        child: const Text("Xóa lọc"),
                      ),
                  ],
                ),
                const SizedBox(height: 16),
                if (_filteredQuizzes.isEmpty)
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Text("Không tìm thấy quiz nào!"),
                    ),
                  )
                else
                  ..._filteredQuizzes.map((quiz) => quizItem(context, quiz)).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryIcon(IconData icon, String label, Color color) {
    bool isSelected = _selectedCategory == label;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedCategory = label;
        });
      },
      borderRadius: BorderRadius.circular(12),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isSelected ? color : color.withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(12),
              border: isSelected ? Border.all(color: Colors.white, width: 2) : null,
              boxShadow: isSelected ? [BoxShadow(color: color.withValues(alpha: 0.4), blurRadius: 8, offset: const Offset(0, 4))] : null,
            ),
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Colors.blue : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
