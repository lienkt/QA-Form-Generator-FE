import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:qaformgenerator/components/html_editor.dart';
import 'package:qaformgenerator/components/pick_file_widget.dart';
import 'package:qaformgenerator/components/uploaded_files.dart';
import 'package:qaformgenerator/model/file_data_model.dart';
import 'package:html_editor_enhanced/html_editor.dart';

/// Answer Editor Form
/// @author: lienkt
class AnswerEditorForm extends StatefulWidget {
  final String hintText;
  final String initialText;
  final Function onChangeHandler;
  final Function onChangeFilesHandler;
  final Function onChangeImgsHandler;
  final List<File_Data_Model>? imgList;
  final List<File_Data_Model>? fileList;

  const AnswerEditorForm({
    Key? key, 
    required this.hintText,
    required this.initialText,
    required this.onChangeHandler,
    required this.onChangeFilesHandler,
    required this.onChangeImgsHandler,
    required this.imgList,
    required this.fileList,
  }) : super(key: key);

  @override
  _AnswerEditorFormState createState() => _AnswerEditorFormState();
}

class _AnswerEditorFormState extends State<AnswerEditorForm> {
  final HtmlEditorController controller = HtmlEditorController();

  @override
  void initState() {
    super.initState();
  }

  /// Update changed image to page
  void _uploadImg(File_Data_Model? file) {
    if(file != null && file.mime.contains('image')) {
      widget.onChangeImgsHandler(file);
    }
  }

  /// Update changed pdf file to page
  void _uploadFile(File_Data_Model? file) {
    if(file != null && file.mime.contains('pdf')) {
      widget.onChangeFilesHandler(file);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 58),
        HtmlEditorCustom(
          initialText: widget.initialText,
          hintText: widget.hintText, 
          onChangeHandler: widget.onChangeHandler
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: 711.0,
          child: Row(
            children: [
              Image.asset(
                'assets/images/file_ic.png',
                filterQuality: FilterQuality.medium,
              ),
              PickFileWidget(
                onDroppedFile: (file) => setState(()=> _uploadFile(file)),
                textBtn: FlutterI18n.translate(context, "common.button.add_doc"),
              ),
              const SizedBox(width: 10),
              Image.asset(
                'assets/images/image_ic.png',
                filterQuality: FilterQuality.medium,
              ),
              PickFileWidget(
                onDroppedFile: (file) => setState(()=> _uploadImg(file)),
                textBtn: FlutterI18n.translate(context, "common.button.add_img"),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 711.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(children: [
                UploadedFiles(
                  fileList: widget.fileList,
                  onChangeFilesHandler: widget.onChangeFilesHandler,
                ),
                UploadedFiles(
                  fileList: widget.imgList,
                  onChangeFilesHandler: widget.onChangeFilesHandler,
                )
              ],)
            ],
          ),
        ),
      ],
    );
  }
}