import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Custom Text Field
/// @author: lienkt
class CustomTextField extends StatefulWidget {
  TextEditingController controller;
  bool validated;
  double width;
  double height;
  String type;
  String labelText;
  String hintText;
  FontWeight fontWeight;
  TextAlign textAlign;
  CustomTextField({
    Key? key, 
    required this.controller,
    required this.width,
    required this.height,
    this.type = '',
    this.validated = true,
    this.labelText = '',
    this.hintText = '',
    this.fontWeight = FontWeight.w400,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
    _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: const EdgeInsets.only(top: 9),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 2.0, color: getBorderColor())
      ),
      child: getTextField(),
    );
  }

  /// Get Text Field
  TextField getTextField() {
    return TextField(
      controller: widget.controller,
      inputFormatters:  getTextFormatter(),
      textAlign: widget.textAlign,
      style: TextStyle(
        fontSize: 13.0,
        fontWeight: widget.fontWeight,
        height: 2.0,
        color: Colors.black                  
      ),
      decoration: getDecoration(),
    );
  }

  /// Get Border Color
  Color getBorderColor() {
    if (widget.validated == false) {
      return Colors.red.shade300;
    }
    return const Color.fromRGBO(218, 218, 218, 1);
  }

  /// Get Text Formatter
  List<TextInputFormatter> getTextFormatter() {
    switch(widget.type) {
      case 'number':
      case 'phone':
        return <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ];
      case 'currency':
        return <TextInputFormatter>[
          CurrencyTextInputFormatter(
            locale: 'fr',
            decimalDigits: 0,
            symbol: '€',
          )
        ];
      default:
        return const [];
    }
  }

  /// Get Decoration
  InputDecoration getDecoration() {
    if (widget.labelText == '') {
      return InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Color.fromRGBO(218, 218, 218, 1),
          fontWeight: FontWeight.w400,
        ),
        filled: true,
        fillColor: Colors.white,
        focusColor: Colors.white,
        hoverColor: Colors.white,
        isDense: true,
        contentPadding: const EdgeInsets.only(left: 8, right: 8),
        border: InputBorder.none,
      );
    } else {
      return InputDecoration(
        labelText: widget.labelText,
        labelStyle: const TextStyle(
          color: Color.fromRGBO(218, 218, 218, 1),
          fontWeight: FontWeight.w400,
        ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Color.fromRGBO(218, 218, 218, 1),
          fontWeight: FontWeight.w400,
        ),
        filled: true,
        fillColor: Colors.white,
        focusColor: Colors.white,
        hoverColor: Colors.white,
        isDense: true,
        contentPadding: const EdgeInsets.only(left: 8, right: 8),
        border: InputBorder.none,
      );
    }
  }
}