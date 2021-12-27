import 'package:flutter/material.dart';
import 'package:flutter_i18n/widgets/I18nText.dart';
import 'percent_indicator.dart';

/// Menu Widget
/// @author: lienkt
class Menu extends StatefulWidget {
  const Menu({
    Key? key,
    this.activePart = 1,
    this.activeStep = 1,
  }) : super(key: key);

  final int activePart;
  final int activeStep;

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 35.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 580,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    I18nText(
                      "common.menu.menu_1", 
                      child: const Text(
                        '',
                        style: TextStyle(
                          color: Color.fromRGBO(183, 183, 183, 1),
                          fontSize: 16,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(width: 75),
                    I18nText(
                      "common.menu.menu_2", 
                      child: const Text(
                        '',
                        style: TextStyle(
                          color: Color.fromRGBO(183, 183, 183, 1),
                          fontSize: 16,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(width: 85),
                    I18nText(
                      "common.menu.menu_3", 
                      child: const Text(
                        '',
                        style: TextStyle(
                          color: Color.fromRGBO(183, 183, 183, 1),
                          fontSize: 16,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(width: 95),
                    I18nText(
                      "common.menu.menu_4", 
                      child: const Text(
                        '',
                        style: TextStyle(
                          color: Color.fromRGBO(183, 183, 183, 1),
                          fontSize: 16,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15.0),
                  padding: const EdgeInsets.only(left: 37),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      circleMenu(1),
                      lineMenu(1),
                      circleMenu(2),
                      lineMenu(2),
                      circleMenu(3),
                      lineMenu(3),
                      circleMenu(4),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Returns the header wrapping the header text.
  Widget circleMenu(int position) {
    if (position <= widget.activePart) {
      return const EnabledCircleStepper();
    } else {
      return const DisabledCircleStepper();
    }
  }

  Widget lineMenu(int position) {
    if (position == widget.activePart) {
      double percent = countActiveStepPercentage();
      return PercentIndicator(percent: percent);
    } else if (position < widget.activePart) {
      return const PercentIndicator(percent: 100.0);
    } else {   
      return const PercentIndicator();
    }
  }

  double countActiveStepPercentage() {
    int stepOfPart1 = 8; // The number parts of first part
    int stepOfPart2 = 2; // The number parts of sencond part
    int stepOfPart3 = 7; // The number parts of third part
    int stepOfPart4 = 2; // The number parts of fouth part
    switch (widget.activeStep) {
      case 1: case 2: case 3: case 4: case 5: case 6: case 7: case 8: 
        return (widget.activeStep*100)/stepOfPart1;

      case 9: case 10: 
        return ((widget.activeStep-8)*100)/stepOfPart2;

      case 11: case 12: case 13: case 14: case 15: case 16: case 17:
        return ((widget.activeStep-10)*100)/stepOfPart3;

      case 18: case 19: 
        return ((widget.activeStep-17)*100)/stepOfPart4;

      default:
        return 0;
    }
  }
}

class EnabledCircleStepper extends StatelessWidget {
  const EnabledCircleStepper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(width: 2.0, color: const Color.fromRGBO(0, 0, 234, 1))
      ),
      child: Container(
        margin: const EdgeInsets.all(7),
        width: 9,
        height: 9,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(0, 0, 234, 1),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}


class DisabledCircleStepper extends StatelessWidget {
  const DisabledCircleStepper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: 9,
      height: 9,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(223, 223, 223, 1),
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}