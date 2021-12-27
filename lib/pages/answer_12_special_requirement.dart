import 'package:flutter/material.dart';
import 'package:qaformgenerator/components/answer_editor_form.dart';
import 'package:qaformgenerator/model/file_data_model.dart';
import 'package:qaformgenerator/model/question_form.dart';
import 'package:provider/provider.dart';

/// Answer page 12
/// @author: lienkt
class Answer12 extends StatefulWidget {
  const Answer12({Key? key,}) : super(key: key);

  @override
  _Answer12State createState() => _Answer12State();
}

class _Answer12State extends State<Answer12> {
  List<File_Data_Model> fileList = [];
  List<File_Data_Model> imgList = [];
  String initialText = '';
  
  @override
  void initState() {
    super.initState();
    final QuestionFormModel questionFormModel = Provider.of<QuestionFormModel>(context, listen: false);
    initialText = questionFormModel.answer12HtmlEditorText;
    fileList = questionFormModel.answer12FileList;
    imgList = questionFormModel.answer12ImgList;
  }

  /// Update changed pdf files to model
  void _updateFileList(File_Data_Model? file) {
    if(file != null) {
      fileList.add(file);
    }
    context.read<QuestionFormModel>().setanswer12FileList(fileList);
  }
  
  /// Update changed images to model
  void _updateImgList(File_Data_Model? file) {
    if(file != null) {
      imgList.add(file);
    }
    context.read<QuestionFormModel>().setanswer12ImgList(imgList);
  }
  
  /// Update changed text to model
  void _updateEditorController(String? changed) {
    context.read<QuestionFormModel>().setanswer12HtmlEditorText(changed!);
    context.read<QuestionFormModel>().changeNextBtn();
  }

  @override
  Widget build(BuildContext context) {
    return AnswerEditorForm(
      hintText: "question.answer_12_texteditor_hint",
      initialText: initialText,
      onChangeHandler: _updateEditorController,
      onChangeFilesHandler: _updateFileList,
      onChangeImgsHandler: _updateImgList,
      fileList: fileList,
      imgList: imgList,
    );
  }
}
