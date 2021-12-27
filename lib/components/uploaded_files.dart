import 'package:flutter/material.dart';
import 'package:qaformgenerator/model/file_data_model.dart';

/// Uploaded Files Widget
/// @author: lienkt
class UploadedFiles extends StatefulWidget {
  final List<File_Data_Model>? fileList;
  final Function onChangeFilesHandler;
  
  const UploadedFiles({
    Key? key,
    required this.fileList,
    required this.onChangeFilesHandler,
  }) : super(key: key);

  @override
  _UploadedFiles createState() => _UploadedFiles();

}

class _UploadedFiles extends State<UploadedFiles> {

  @override
  Widget build(BuildContext context) {
    List<Widget> list = <Widget>[];
    for(var i = 0; i < widget.fileList!.length; i++){
        list.add(const SizedBox(height: 8.0));
        String name = widget.fileList![i].name;
        if (name.length > 25) {
          name = name.substring(0,25) + '...';
        }
        list.add(uploadedFileTemplate(i,name));
    }
    return Column(children: list);
  }

  Widget uploadedFileTemplate(int pot, String fileName) {
    return Container(
      width: 227.0,
      height: 21.0,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(248, 248, 248, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 14.0),
            child: Text(
              fileName,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Raleway',
                fontSize: 11.0,
              ),
            ),
          ),
          IconButton(
            icon: Image.asset(
              'assets/images/delete_ic.png',
              filterQuality: FilterQuality.medium,
            ),
            iconSize: 10,
            splashRadius: 10,
            padding: const EdgeInsets.all(0.0),
            onPressed: () { 
              setState(() {
                widget.fileList!.removeAt(pot);
                widget.onChangeFilesHandler(null);
              });
            },
          ),
        ],
      ),
    );
  }
}
