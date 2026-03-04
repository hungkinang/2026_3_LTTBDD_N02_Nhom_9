import 'question_model.dart';

class Quiz {
  final String title;
  final String info;
  final String level;
  final List<Question> questions;

  Quiz({
    required this.title,
    required this.info,
    required this.level,
    required this.questions,
  });
}
