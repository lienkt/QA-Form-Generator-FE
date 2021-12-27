import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_i18n/widgets/I18nText.dart';

/// Header Widget
/// @author: lienkt
class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110, 
      child: Stack(
        children: <Widget>[
          const HeaderTop(),
          Positioned(
            top: 29,
            right: 0,
            left: 0,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.asset(
                  'assets/images/avata.png',
                  filterQuality: FilterQuality.medium,
                  width: 80,
                  height: 80,
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderTop extends StatelessWidget {
  const HeaderTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: Color.fromRGBO(218, 218, 218, 1)),
      )),
      alignment: FractionalOffset.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 48.0),
          ),
          Container(
            padding: const EdgeInsets.only(right: 48.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start ,
              children:  [
                Container(
                  margin: const EdgeInsets.only(right: 8.0),
                  child: TextButton( 
                    onPressed: (){
                      html.window.open('https://www.hello-pomelo.com/contact',"_blank");
                    },
                    child: I18nText(
                      "common.need_help", 
                      child: const Text(
                        '',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          decoration: TextDecoration.none
                        ),
                      ),
                    ),
                  ),
                ),
                Image.asset(
                  'assets/images/vector.png',
                  filterQuality: FilterQuality.medium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
