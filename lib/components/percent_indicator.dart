import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

/// Percent Indicator Widget
/// @author: lienkt
class PercentIndicator extends StatefulWidget {
  final double percent;

  const PercentIndicator({
    Key? key,
    this.percent = 0,
  }) : super(key: key);

  @override
  _PercentIndicatorState createState() => _PercentIndicatorState();
}

class _PercentIndicatorState extends State<PercentIndicator> {
  // double percent = 50;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
          width: 138,
          child: LinearPercentIndicator(
            padding: const EdgeInsets.only(right: 0.0),
            lineHeight: 2.0,
            percent: widget.percent/100,
            linearStrokeCap: LinearStrokeCap.butt,
            progressColor: const Color.fromRGBO(0, 0, 234, 1),
            backgroundColor: const Color.fromRGBO(223, 223, 223, 1),
          ),
    );
  }
}