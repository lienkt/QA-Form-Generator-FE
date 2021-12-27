
import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_i18n/widgets/I18nText.dart';

import '../model/file_data_model.dart';

/// DropZone Widget
/// @author: lienkt
class DropZoneWidget extends StatefulWidget {

  final ValueChanged<File_Data_Model> onDroppedFile;
  final String mimeType;

  const DropZoneWidget({
    Key? key,
    required this.onDroppedFile,
    required this.mimeType}):super(key: key);
  @override
  _DropZoneWidgetState createState() => _DropZoneWidgetState();
}

class _DropZoneWidgetState extends State<DropZoneWidget> {
  late DropzoneViewController controller;
  bool highlight = false;

  @override
  Widget build(BuildContext context) {

    return buildDecoration(
       
    child: Stack(
      children: [
        DropzoneView(
            onCreated: (controller) => this.controller = controller,
            onDrop: uploadedFile,
            onHover:() => setState(()=> highlight = true),
            onLeave: ()=> setState(()=>highlight = false)
        ),

        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              I18nText(
                "common.dropzone.drag_msg",
                child: const Text(
                  '',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(183, 183, 183, 1),
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              SizedBox(
                width: 360,
                child: Row(
                  children: [
                    I18nText(
                      "common.dropzone.or",
                      child: const Text(
                        '',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromRGBO(183, 183, 183, 1),
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        final events = await controller.pickFiles();
                        if(events.isEmpty) return;
                        uploadedFile(events.first);
                      },
                      child: I18nText(
                        "common.dropzone.load_flie",
                        child: const Text(
                          '',
                          style: TextStyle(
                            color: Color.fromRGBO(0, 0, 234, 1),
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                          decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    I18nText(
                      "common.dropzone.from_computer",
                      child: const Text(
                        '',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromRGBO(183, 183, 183, 1),
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ],
                )
              ),
              I18nText(
                "common.dropzone.accept_files",
                translationParams: {"mime": widget.mimeType},
                child: const Text(
                  '',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(183, 183, 183, 1),
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }

  Future uploadedFile(dynamic event) async {
    final name = event.name.toString();
    final mime = await controller.getFileMIME(event);
    final byte = await controller.getFileSize(event);
    final url = await controller.createFileUrl(event);
    final Uint8List data = await controller.getFileData(event);
    final droppedFile = File_Data_Model
      (name: name, mime: mime, bytes: byte, url: url, data: data);
    widget.onDroppedFile(droppedFile);
    setState(() {
      highlight = false;
    });
  }

  Widget buildDecoration({required Widget child}){
    final colorBackground =  highlight? const Color.fromRGBO(227, 243, 253, 1): Colors.white;
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        child: DottedBorder(
          borderType: BorderType.RRect,
          color: const Color.fromRGBO(218, 218, 218, 1),
          strokeWidth: 2,
          dashPattern: const [5,3],
          radius: const Radius.circular(5),
          padding: EdgeInsets.zero,
          child: child
        ),
        color: colorBackground,
      ),
    );
  }
}
