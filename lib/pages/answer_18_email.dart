import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:qaformgenerator/components/custom_textfield.dart';
import 'package:qaformgenerator/model/question_form.dart';
import 'package:provider/provider.dart';

/// Answer page 18
/// @author: lienkt
class Answer18 extends StatefulWidget {
  const Answer18({Key? key,}) : super(key: key);

  @override
  _Answer18State createState() => _Answer18State();
}

class _Answer18State extends State<Answer18> {
  late bool emailValidate;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    final QuestionFormModel questionFormModel = Provider.of<QuestionFormModel>(context, listen: false);
    emailValidate = questionFormModel.answer18EmailValidate;
    emailController = TextEditingController(text: questionFormModel.answer18Email);
    // Start listening to changes.
    emailController.addListener(_updateValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    emailController.dispose();
    super.dispose();
  }

  /// Update changed receiver email to model
  void _updateValue() {
    context.read<QuestionFormModel>().setanswer18Email(emailController.text);
    setState(() {
      if(emailController.text.isNotEmpty) {
        emailValidate = RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(emailController.text);
      } else {
        emailValidate = true;
      }
    });
    context.read<QuestionFormModel>().setanswer18EmailValidate(emailValidate);
    context.read<QuestionFormModel>().changeNextBtn();
  }

  @override
  Widget build(BuildContext context) {
    Color color = const Color.fromRGBO(231, 231, 231, 1);
    if (context.read<QuestionFormModel>().nextButton) {
      color = const Color.fromRGBO(255, 50, 133, 1);
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 24),
        CustomTextField(
          width: 506.0,
          height: 48.0,
          controller: emailController,
          hintText: FlutterI18n.translate(context, "question.answer_18_text_hint_email"),
          type: 'email',
          validated: emailValidate,
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(506, 47),
            textStyle: const TextStyle(fontSize: 16),
            primary: color,
          ),
          onPressed: () {
            if (context.read<QuestionFormModel>().nextButton) {
              context.read<QuestionFormModel>().increaseStep();
            }
          },
          child: Text(FlutterI18n.translate(context, "common.button.receive_doc").toUpperCase()),
        ),
        const SizedBox(height: 50),
      ],
    ); 
  }
}
