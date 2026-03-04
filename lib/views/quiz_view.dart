import 'dart:async';
import 'package:flutter/material.dart';
import '../models/quiz_model.dart';
import '../models/question_model.dart';
import 'result_view.dart';

class QuizView extends StatefulWidget {
  final Quiz quiz;
  const QuizView({super.key, required this.quiz});

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  int score = 0;
  late Timer _timer;
  int _start = 600; // 10 minutes default
  List<int?> userAnswers = [];

  @override
  void initState() {
    super.initState();
    userAnswers = List.filled(widget.quiz.questions.length, null);
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
          navigateToResult();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  String get timerText {
    int minutes = _start ~/ 60;
    int seconds = _start % 60;
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void navigateToResult() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ResultView(
          score: score,
          totalQuestions: widget.quiz.questions.length,
          quiz: widget.quiz,
          userAnswers: userAnswers,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Question currentQuestion = widget.quiz.questions[currentQuestionIndex];
    double progress = (currentQuestionIndex + 1) / widget.quiz.questions.length;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Câu ${currentQuestionIndex + 1}/${widget.quiz.questions.length}",
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                timerText,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 8,
            width: double.infinity,
            color: Colors.blue.withOpacity(0.2),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: progress,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.green, Colors.yellow, Colors.orange, Colors.red],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Text(
                      currentQuestion.questionText,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 32),
                  ...List.generate(
                    currentQuestion.options.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedAnswerIndex = index;
                            userAnswers[currentQuestionIndex] = index;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 18,
                          ),
                          decoration: BoxDecoration(
                            color: selectedAnswerIndex == index
                                ? Colors.blue.shade50
                                : Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: selectedAnswerIndex == index
                                  ? Colors.blue
                                  : Colors.grey.shade300,
                              width: 2,
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "${String.fromCharCode(65 + index)}. ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: selectedAnswerIndex == index
                                      ? Colors.blue
                                      : Colors.black87,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  currentQuestion.options[index],
                                  style: TextStyle(
                                    color: selectedAnswerIndex == index
                                        ? Colors.blue
                                        : Colors.black87,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: ElevatedButton(
              onPressed: selectedAnswerIndex == null
                  ? null
                  : () {
                      int currentScore = score;
                      if (selectedAnswerIndex == currentQuestion.correctAnswerIndex) {
                        currentScore++;
                      }
                      if (currentQuestionIndex < widget.quiz.questions.length - 1) {
                        setState(() {
                          score = currentScore;
                          currentQuestionIndex++;
                          selectedAnswerIndex = null;
                        });
                      } else {
                        setState(() {
                          score = currentScore;
                        });
                        navigateToResult();
                      }
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
              ),
              child: const Text(
                "Tiếp theo",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
