import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:qaformgenerator/components/dropzone_widget.dart';
import 'package:qaformgenerator/components/uploaded_files.dart';
import 'package:qaformgenerator/model/file_data_model.dart';
import 'package:qaformgenerator/model/question_form.dart';
import 'package:provider/provider.dart';

/// Answer page 10
/// @author: lienkt
class Answer10 extends StatefulWidget {
  const Answer10({
    Key? key
  }) : super(key: key);

  @override
  _Answer10State createState() => _Answer10State();
}

class _Answer10State extends State<Answer10> {
  List<File_Data_Model> fileList = [];

  @override
  void initState() {
    super.initState();
    final QuestionFormModel questionFormModel = Provider.of<QuestionFormModel>(context, listen: false);
    fileList = questionFormModel.answer10FileList;
  }
  
  /// Update changed mockup pdf file to model
  void _updateFileList(File_Data_Model? file) {
    if(file != null && file.mime.contains('pdf')) {
      fileList = [];
      fileList.add(file);
    }
    context.read<QuestionFormModel>().setanswer10FileList(fileList);
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
          height: 119.0,
          child: DropZoneWidget(
            onDroppedFile: (file) => setState(()=>_updateFileList(file)),
            mimeType: FlutterI18n.translate(context, "question.answer_10_mimetype"),
          ),
        ),
        SizedBox(
          width: 711.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              UploadedFiles(
                fileList: fileList,
                onChangeFilesHandler: _updateFileList,
              )
            ],
          ),
        ),
        const SizedBox(height: 21.0,),
      ],
    ); 
  }
}
