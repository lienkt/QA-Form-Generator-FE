import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_i18n/widgets/I18nText.dart';
import 'package:qaformgenerator/components/custom_textfield.dart';
import 'package:qaformgenerator/model/question_form.dart';
import 'package:provider/provider.dart';

/// Answer page 1
/// @author: lienkt
class Answer1 extends StatefulWidget {
  const Answer1({Key? key,}) : super(key: key);

  @override
  _Answer1State createState() => _Answer1State();
}

class _Answer1State extends State<Answer1> {

  late TextEditingController enterpriseController;
  late Color color;

  @override
  void initState() {
    super.initState();
    color = const Color.fromRGBO(231, 231, 231, 1);
    final QuestionFormModel questionFormModel = Provider.of<QuestionFormModel>(context, listen: false);
    enterpriseController = TextEditingController(text: questionFormModel.enterpriseName);
    // Start listening to changes.
    enterpriseController.addListener(_updateValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    enterpriseController.dispose();
    super.dispose();
  }

  /// Update changed data to model
  void _updateValue() {
    context.read<QuestionFormModel>().setEnterpriseName(enterpriseController.text);
    context.read<QuestionFormModel>().changeNextBtn();
    if (context.read<QuestionFormModel>().nextButton) {
      setState(() { color = const Color.fromRGBO(255, 50, 133, 1); });
    } else {
      setState(() { color = const Color.fromRGBO(231, 231, 231, 1); });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 58),
        CustomTextField(
          width: 232.0,
          height: 51.0,
          controller: enterpriseController,
          labelText: FlutterI18n.translate(context, "question.answer_1_text_label").toUpperCase(),
          hintText: FlutterI18n.translate(context, "question.answer_1_text_hint"),
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(height: 50),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(232, 47),
            textStyle: const TextStyle(fontSize: 20),
            primary: color,
          ),
          onPressed: () {
            if (context.read<QuestionFormModel>().nextButton) {
              context.read<QuestionFormModel>().increaseStep();
            }
          },
          child: I18nText("common.button.start"),
        ),
      ],
    ); 
  }
}
