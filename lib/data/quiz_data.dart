import '../models/quiz_model.dart';
import '../models/question_model.dart';

class QuizData {
  static List<Quiz> quizzes = [
    Quiz(
      title: "Toán Cơ Bản",
      info: "15 Câu | 10 Phút",
      level: "Dễ",
      questions: [
        Question(
          questionText: "Đâu là kết quả của 8 x 7?",
          options: ["54", "56", "64", "72"],
          correctAnswerIndex: 1,
        ),
        Question(
          questionText: "Kết quả của 125 + 75 là bao nhiêu?",
          options: ["190", "200", "210", "225"],
          correctAnswerIndex: 1,
        ),
        Question(
          questionText: "9 - 7 bằng bao nhiêu?",
          options: ["1", "2", "3", "4"],
          correctAnswerIndex: 1,
        ),
      ],
    ),
    Quiz(
      title: "Ngữ Pháp Tiếng Anh",
      info: "20 Câu | 15 Phút",
      level: "Trung Bình",
      questions: [
        Question(
          questionText: "Which one is a verb?",
          options: ["Beautiful", "Run", "Happiness", "Quickly"],
          correctAnswerIndex: 1,
        ),
        Question(
          questionText: "She ___ to school every day.",
          options: ["go", "goes", "going", "gone"],
          correctAnswerIndex: 1,
        ),
      ],
    ),
    Quiz(
      title: "Vật Lý Cơ Bản",
      info: "12 Câu | 10 Phút",
      level: "Khó",
      questions: [
        Question(
          questionText: "Đơn vị của lực là gì?",
          options: ["Watt", "Joule", "Newton", "Pascal"],
          correctAnswerIndex: 2,
        ),
        Question(
          questionText: "Vận tốc ánh sáng xấp xỉ bao nhiêu?",
          options: ["300,000 km/s", "30,000 km/s", "3,000 km/s", "300 km/s"],
          correctAnswerIndex: 0,
        ),
      ],
    ),
    Quiz(
      title: "Sinh Học Đại Cương",
      info: "10 Câu | 8 Phút",
      level: "Dễ",
      questions: [
        Question(
          questionText: "Đơn vị cơ bản của sự sống là gì?",
          options: ["Nguyên tử", "Tế bào", "Phân tử", "Mô"],
          correctAnswerIndex: 1,
        ),
      ],
    ),
  ];
}
