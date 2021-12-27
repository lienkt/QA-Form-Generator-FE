import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:qaformgenerator/components/custom_textfield.dart';
import 'package:qaformgenerator/model/question_form.dart';
import 'package:provider/provider.dart';

/// Answer page 16
/// @author: lienkt
class Answer16 extends StatefulWidget {
  const Answer16({Key? key,}) : super(key: key);

  @override
  _Answer16State createState() => _Answer16State();
}

class _Answer16State extends State<Answer16> {
  late TextEditingController nameController;
  late TextEditingController firstNameController;
  late bool emailValidate;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    final QuestionFormModel questionFormModel = Provider.of<QuestionFormModel>(context, listen: false);
    nameController = TextEditingController(text: questionFormModel.answer16Name);
    firstNameController = TextEditingController(text: questionFormModel.answer16Firstname);
    emailValidate = questionFormModel.answer16EmailValidate;
    emailController = TextEditingController(text: questionFormModel.answer16Email);
    phoneController = TextEditingController(text: questionFormModel.answer16Phone);
    // Start listening to changes.
    nameController.addListener(_updateValue);
    firstNameController.addListener(_updateValue);
    emailController.addListener(_updateValue);
    phoneController.addListener(_updateValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    nameController.dispose();
    firstNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  /// Update changed contact info to model
  void _updateValue() {
    context.read<QuestionFormModel>().setanswer16Name(nameController.text);
    context.read<QuestionFormModel>().setanswer16Firstname(firstNameController.text);
    context.read<QuestionFormModel>().setanswer16Email(emailController.text);
    setState(() {
      if(emailController.text.isNotEmpty) {
        emailValidate = RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(emailController.text);
      } else {
        emailValidate = true;
      }
    });
    context.read<QuestionFormModel>().setanswer16EmailValidate(emailValidate);
    context.read<QuestionFormModel>().setanswer16Phone(phoneController.text);
    context.read<QuestionFormModel>().changeNextBtn();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 58),
        CustomTextField(
          width: 506.0,
          height: 48.0,
          controller: firstNameController,
          hintText: FlutterI18n.translate(context, "question.answer_16_text_hint_firstname"),
        ),
        const SizedBox(height: 16),
        CustomTextField(
          width: 506.0,
          height: 48.0,
          controller: nameController,
          hintText: FlutterI18n.translate(context, "question.answer_16_text_hint_name"),
        ),
        const SizedBox(height: 16),
        CustomTextField(
          width: 506.0,
          height: 48.0,
          controller: emailController,
          hintText: FlutterI18n.translate(context, "question.answer_16_text_hint_email"),
          type: 'email',
          validated: emailValidate,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          width: 506.0,
          height: 48.0,
          controller: phoneController,
          hintText: FlutterI18n.translate(context, "question.answer_16_text_hint_phone"),
          type: 'phone',
        ),
        const SizedBox(height: 50),
      ],
    ); 
  }
}
