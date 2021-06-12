import 'package:devquiz/challenge/widgets/awnser/awnser.widget.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/model/awnsers_model.dart';
import 'package:devquiz/shared/model/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final ValueChanged<bool> onSelected;
  final QuestionModel question;
  const QuizWidget({Key? key, required this.question, required this.onSelected})
      : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;

  AwnserModel awnser(int index) => widget.question.awnsers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 64,
            ),
            Text(
              widget.question.title,
              style: AppTextStyles.heading,
            ),
            SizedBox(
              height: 24,
            ),
            for (var i = 0; i < widget.question.awnsers.length; i++)
              AwnserWidget(
                anwser: awnser(i),
                isSelected: indexSelected == i,
                disabled: indexSelected != -1,
                onTap: (value) {
                  indexSelected = i;
                  setState(() {});
                  Future.delayed(Duration(seconds: 1))
                      .then((_) => widget.onSelected(value));
                },
              ),
          ],
        ),
      ),
    );
  }
}
