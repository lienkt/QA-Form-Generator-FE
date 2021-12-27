import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:html_editor_enhanced/html_editor.dart';

/// Html Editor Custom Widget
/// @author: lienkt
class HtmlEditorCustom extends StatefulWidget {
  final String hintText;
  final String initialText;
  final Function onChangeHandler;

  const HtmlEditorCustom({
    Key? key, 
    required this.hintText,
    required this.initialText,
    required this.onChangeHandler
  }) : super(key: key);

  @override
  _HtmlEditorCustomState createState() => _HtmlEditorCustomState();
}

class _HtmlEditorCustomState extends State<HtmlEditorCustom> {

  final HtmlEditorController controller = HtmlEditorController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 711.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [ 
              ToolbarWidget(
                controller: controller, 
                callbacks: null, 
                htmlToolbarOptions: const HtmlToolbarOptions(
                  toolbarType: ToolbarType.nativeGrid,
                  toolbarItemHeight: 23,
                  defaultToolbarButtons: [
                    FontSettingButtons(
                      fontName: false,
                      fontSizeUnit: false,
                    ),
                    FontButtons(
                      clearAll: false,
                      superscript: false,
                      subscript: false,
                    ),
                    ColorButtons(),
                    ListButtons(listStyles: false),
                    ParagraphButtons(textDirection: false, lineHeight: false, caseConverter: false),
                  ],
                  dropdownElevation: 8,
                  dropdownIconSize: 24,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 711,
          height: 374,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 2.0, color: const Color.fromRGBO(218, 218, 218, 1))
          ),
          child: HtmlEditor(
            controller: controller,
            callbacks: Callbacks(
              onChangeContent: (String? changed) {
                widget.onChangeHandler(changed);
              },
            ), 
            htmlEditorOptions: getHtmlEditorOptions(),
            htmlToolbarOptions: const HtmlToolbarOptions(
              toolbarPosition: ToolbarPosition.custom,
              toolbarType: ToolbarType.nativeGrid,
            ),
            otherOptions: const OtherOptions(height: 358),
          ),
        ),
      ],
    );
  }
  HtmlEditorOptions getHtmlEditorOptions() {
    if(widget.initialText.isEmpty) {
      return HtmlEditorOptions(
        hint: FlutterI18n.translate(context, widget.hintText),
      );
    } else {
      return HtmlEditorOptions(
        hint: '',
        initialText: widget.initialText,
      );
    }
  }
}