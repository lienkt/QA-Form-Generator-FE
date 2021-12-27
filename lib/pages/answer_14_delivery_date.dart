import 'package:flutter/material.dart';
import 'package:qaformgenerator/components/date_picker.dart';
import 'package:qaformgenerator/model/question_form.dart';
import 'package:provider/provider.dart';

/// Answer page 14
/// @author: lienkt
class Answer14 extends StatefulWidget {
  const Answer14({Key? key,}) : super(key: key);

  @override
  _Answer14State createState() => _Answer14State();
}

class _Answer14State extends State<Answer14> {
  late DateTime startDate;

  @override
  void initState() {
    super.initState();
    final QuestionFormModel questionFormModel = Provider.of<QuestionFormModel>(context, listen: false);
    startDate = questionFormModel.answer14DeploymentDate;
  }

  /// Update changed date to model
  void _updateValue(DateTime date) {
    context.read<QuestionFormModel>().setanswer14DeploymentDate(date);
    context.read<QuestionFormModel>().changeNextBtn();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 58),
        DatePickerWidget(
          restorationId: 'main',
          defaultDate: startDate,
          updateDate: _updateValue,
        ),
        const SizedBox(height: 50),
      ],
    ); 
  }
}
