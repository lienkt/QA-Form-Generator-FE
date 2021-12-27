import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:qaformgenerator/model/file_data_model.dart';
import 'package:qaformgenerator/model/question_form.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

/// Result page
/// @author: lienkt
class Result extends StatefulWidget {
  const Result({Key? key,}) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  late final QuestionFormModel questionFormModel;

  @override
  void initState() {
    super.initState();
    questionFormModel = Provider.of<QuestionFormModel>(context, listen: false);
    postProject();
  }

  /// Encode FileList To String 
  String toStringFileList (List<File_Data_Model> fileList) {
    List<String> stringFileList = [];
    for (var file in fileList) {
      stringFileList.add(file.getStringData());
    }
    return json.encode(stringFileList);
  }

  /// Check Deployment Date
  String checkDeploymentDate() {
    var answer14DeploymentDate = DateFormat('d/M/y').format(questionFormModel.answer14DeploymentDate);
    if(DateFormat('d/M/y').format(DateTime.now()) == answer14DeploymentDate) {
        return "";
    }
    return answer14DeploymentDate;
  }

  /// Send Project to sever
  void postProject() async {
    String projectName = questionFormModel.enterpriseName + '_' + DateFormat('yMdHms').format(DateTime.now());
        
    String answers = json.encode({
      "projectName": projectName,
      "sentStatus": 0,
      "companyName": questionFormModel.enterpriseName,
      "description": questionFormModel.answer2HtmlEditorText,
      "answer2FileList": toStringFileList(questionFormModel.answer2FileList),
      "answer2ImgList": toStringFileList(questionFormModel.answer2ImgList),
      "answer3FileList1": toStringFileList(questionFormModel.answer3FileList1),
      "answer3FileList2": toStringFileList(questionFormModel.answer3FileList2),
      "objective": questionFormModel.answer4HtmlEditorText,
      "answer4FileList": toStringFileList(questionFormModel.answer4FileList),
      "answer4ImgList": toStringFileList(questionFormModel.answer4ImgList),
      "target": questionFormModel.answer5HtmlEditorText,
      "answer5FileList": toStringFileList(questionFormModel.answer5FileList),
      "answer5ImgList": toStringFileList(questionFormModel.answer5ImgList),
      "quantitativeObjectives": questionFormModel.answer6HtmlEditorText,
      "answer6FileList": toStringFileList(questionFormModel.answer6FileList),
      "answer6ImgList": toStringFileList(questionFormModel.answer6ImgList),
      "typeOfApp": questionFormModel.answer7HtmlEditorText,
      "answer7FileList": toStringFileList(questionFormModel.answer7FileList),
      "answer7ImgList": toStringFileList(questionFormModel.answer7ImgList),
      "scope": questionFormModel.answer8HtmlEditorText,
      "answer8FileList": toStringFileList(questionFormModel.answer8FileList),
      "answer8ImgList": toStringFileList(questionFormModel.answer8ImgList),
      "graphicCharter": questionFormModel.answer9HtmlEditorText,
      "answer9FileList": toStringFileList(questionFormModel.answer9FileList),
      "answer9ImgList": toStringFileList(questionFormModel.answer9ImgList),
      "answer10FileList": toStringFileList(questionFormModel.answer10FileList),
      "content": questionFormModel.answer11HtmlEditorText,
      "answer11FileList": toStringFileList(questionFormModel.answer11FileList),
      "answer11ImgList": toStringFileList(questionFormModel.answer11ImgList),
      "technicalContrain": questionFormModel.answer12HtmlEditorText,
      "answer12FileList": toStringFileList(questionFormModel.answer12FileList),
      "answer12ImgList": toStringFileList(questionFormModel.answer12ImgList),
      "expectedDelivery": questionFormModel.answer13HtmlEditorText,
      "answer13FileList": toStringFileList(questionFormModel.answer13FileList),
      "answer13ImgList": toStringFileList(questionFormModel.answer13ImgList),
      "deploymentDate": checkDeploymentDate(),
      "budget": questionFormModel.answer15Budget,
      "contactInfoName": questionFormModel.answer16Name,
      "contactInfoFirstName": questionFormModel.answer16Firstname,
      "contactInfoEmail": questionFormModel.answer16Email,
      "contactInfoPhone": questionFormModel.answer16Phone,
      "otherInfo": questionFormModel.answer17HtmlEditorText,
      "answer17FileList": toStringFileList(questionFormModel.answer17FileList),
      "answer17ImgList": toStringFileList(questionFormModel.answer17ImgList),
      "receivedEmail": questionFormModel.answer18Email
    });

    var url = Uri.parse(dotenv.env['NODE_URL']! + 'projects/');
    var response = await http.post(url, 
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
		  body: answers
    );
    print('Response: ${response.body}');
  } 

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/check_circle.png',
          filterQuality: FilterQuality.medium,
          width: 81.0,
          height: 41.0,
        ),
        const SizedBox(height: 32),
        SizedBox(
          width: 565,
          child: I18nText(
            "question.answer_19", 
            child: const Text(
              '',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(74, 74, 74, 1),
                fontFamily: 'Merriweather',
                fontSize: 36,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
      ],
    ); 
  }
}
