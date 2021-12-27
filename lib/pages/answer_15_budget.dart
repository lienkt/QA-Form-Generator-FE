import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:qaformgenerator/components/custom_textfield.dart';
import 'package:qaformgenerator/model/question_form.dart';
import 'package:provider/provider.dart';

/// Answer page 15
/// @author: lienkt
class Answer15 extends StatefulWidget {
  const Answer15({Key? key,}) : super(key: key);

  @override
  _Answer15State createState() => _Answer15State();
}

class _Answer15State extends State<Answer15> {
  late TextEditingController budgetController;
  late int budget;

  @override
  void initState() {
    super.initState();
    final QuestionFormModel questionFormModel = Provider.of<QuestionFormModel>(context, listen: false);
    budgetController = TextEditingController(text: questionFormModel.answer15Budget);
    budgetController.addListener(_updateValue);
  }

  @override
  void dispose() {
    budgetController.dispose();
    super.dispose();
  }

  /// Update changed budget to model
  void _updateValue() {
    context.read<QuestionFormModel>().setanswer15Budget(budgetController.text);
    context.read<QuestionFormModel>().changeNextBtn();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 58),
        CustomTextField(
          width: 177.0,
          height: 48.0,
          controller: budgetController,
          hintText: FlutterI18n.translate(context, "question.answer_15_text_label"),
          type: 'currency',
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 50),
      ],
    ); 
  }
}
