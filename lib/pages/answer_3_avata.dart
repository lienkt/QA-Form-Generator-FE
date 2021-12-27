import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:qaformgenerator/components/dropzone_widget.dart';
import 'package:qaformgenerator/components/uploaded_files.dart';
import 'package:qaformgenerator/model/file_data_model.dart';
import 'package:qaformgenerator/model/question_form.dart';
import 'package:provider/provider.dart';

/// Answer page 3
/// @author: lienkt
class Answer3 extends StatefulWidget {
  const Answer3({
    Key? key
  }) : super(key: key);

  @override
  _Answer3State createState() => _Answer3State();
}

class _Answer3State extends State<Answer3> {
  List<File_Data_Model> fileList1 = [];
  List<File_Data_Model> fileList2 = [];

  @override
  void initState() {
    super.initState();
    final QuestionFormModel questionFormModel = Provider.of<QuestionFormModel>(context, listen: false);
    fileList1 = questionFormModel.answer3FileList1;
    fileList2 = questionFormModel.answer3FileList2;
  }
  
  /// Update changed logo to model
  void _updateFileList1(File_Data_Model? file) {
    if(file != null && file.mime.contains('image')) {
      fileList1 = [];
      fileList1.add(file);
    }
    context.read<QuestionFormModel>().setanswer3FileList1(fileList1);
    context.read<QuestionFormModel>().changeNextBtn();
  }

  /// Update changed cover to model
  void _updateFileList2(File_Data_Model? file) {
    if(file != null && file.mime.contains('image')) {
      fileList2 = [];
      fileList2.add(file);
    }
    context.read<QuestionFormModel>().setanswer3FileList2(fileList2);
    context.read<QuestionFormModel>().changeNextBtn();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 24.0,),
        SizedBox(
          width: 711.0,
          child: I18nText(
            "question.answer_2_label_your_logo",
            child: const Text(
              '',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(74, 74, 74, 1),
                fontSize: 18,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
        const SizedBox(height: 4.0,),
        SizedBox(
          width: 711.0,
          height: 119.0,
          child: DropZoneWidget(
            onDroppedFile: (file) => setState(()=>_updateFileList1(file)),
            mimeType: FlutterI18n.translate(context, "question.answer_3_mimetype_1"),
          ),
        ),
        SizedBox(
          width: 711.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              UploadedFiles(
                fileList: fileList1,
                onChangeFilesHandler: _updateFileList1,
              )
            ],
          ),
        ),
        const SizedBox(height: 21.0,),
        SizedBox(
          width: 711.0,
          child: I18nText(
            "question.answer_2_label_your_cover",
            child: const Text(
              '',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(74, 74, 74, 1),
                fontSize: 18,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
        const SizedBox(height: 4.0,),
        SizedBox(
          width: 711.0,
          height: 119.0,
          child: DropZoneWidget(
            onDroppedFile: (file) => setState(()=>_updateFileList2(file)), 
            mimeType: FlutterI18n.translate(context, "question.answer_3_mimetype_2"),
          ),
        ),
        SizedBox(
          width: 711.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              UploadedFiles(
                fileList: fileList2,
                onChangeFilesHandler: _updateFileList2,
              )
            ],
          ),
        ),
      ],
    ); 
  }
}
