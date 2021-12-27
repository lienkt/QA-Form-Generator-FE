import 'package:flutter/material.dart';
import 'package:qaformgenerator/components/answer_editor_form.dart';
import 'package:qaformgenerator/model/file_data_model.dart';
import 'package:qaformgenerator/model/question_form.dart';
import 'package:provider/provider.dart';

/// Answer page 11
/// @author: lienkt
class Answer11 extends StatefulWidget {
  const Answer11({Key? key,}) : super(key: key);

  @override
  _Answer11State createState() => _Answer11State();
}

class _Answer11State extends State<Answer11> {
  List<File_Data_Model> fileList = [];
  List<File_Data_Model> imgList = [];
  String initialText = '';
  
  @override
  void initState() {
    super.initState();
    final QuestionFormModel questionFormModel = Provider.of<QuestionFormModel>(context, listen: false);
    initialText = questionFormModel.answer11HtmlEditorText;
    fileList = questionFormModel.answer11FileList;
    imgList = questionFormModel.answer11ImgList;
  }

  /// Update changed pdf files to model
  void _updateFileList(File_Data_Model? file) {
    if(file != null) {
      fileList.add(file);
    }
    context.read<QuestionFormModel>().setanswer11FileList(fileList);
  }
  
  /// Update changed images to model
  void _updateImgList(File_Data_Model? file) {
    if(file != null) {
      imgList.add(file);
    }
    context.read<QuestionFormModel>().setanswer11ImgList(imgList);
  }
  
  /// Update changed text to model
  void _updateEditorController(String? changed) {
    context.read<QuestionFormModel>().setanswer11HtmlEditorText(changed!);
    context.read<QuestionFormModel>().changeNextBtn();
  }

  @override
  Widget build(BuildContext context) {
    return AnswerEditorForm(
      hintText: "question.answer_11_texteditor_hint",
      initialText: initialText,
      onChangeHandler: _updateEditorController,
      onChangeFilesHandler: _updateFileList,
      onChangeImgsHandler: _updateImgList,
      fileList: fileList,
      imgList: imgList,
    );
  }
}
