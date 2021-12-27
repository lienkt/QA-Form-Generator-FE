import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

import '../model/file_data_model.dart';

/// Pick File Widget
/// @author: lienkt
class PickFileWidget extends StatefulWidget {

  final ValueChanged<File_Data_Model> onDroppedFile;
  final String textBtn;

  const PickFileWidget({
    Key? key,
    required this.onDroppedFile,
    this.textBtn = '',
  }):super(key: key);
  @override
  _PickFileWidgetState createState() => _PickFileWidgetState();
}

class _PickFileWidgetState extends State<PickFileWidget> {
  late DropzoneViewController controller;
  bool highlight = false;
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 1,
          height: 1,
          child: DropzoneView(
            onCreated: (controller) => this.controller = controller,
            onDrop: uploadedFile,
          ),
        ),
        TextButton(
          onPressed: () async {
            final events = await controller.pickFiles();
            if(events.isEmpty) return;
            uploadedFile(events.first);
          },
          child: Text(
            widget.textBtn,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
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
  }

}