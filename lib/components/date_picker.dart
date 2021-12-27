import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Date Picker Widget
/// @author: lienkt
class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({
    Key? key, 
    this.restorationId,
    required this.defaultDate,
    required this.updateDate,
  }) : super(key: key);

  final String? restorationId;
  final DateTime defaultDate;
  final Function updateDate;

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

/// This is the private State class that goes with DatePickerWidget.
/// RestorationProperty objects can be used because of RestorationMixin.
class _DatePickerWidgetState extends State<DatePickerWidget> with RestorationMixin {
  @override
  String? get restorationId => widget.restorationId;
  @override
  DateTime get defaultDate => widget.defaultDate;
  String date = '';
  late final RestorableDateTime _selectedDate;
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture;

  @override
  void initState() {
    super.initState();
    _selectedDate = RestorableDateTime(defaultDate);
    _restorableDatePickerRouteFuture =
        RestorableRouteFuture<DateTime?>(
      onComplete: _selectDate,
      onPresent: (NavigatorState navigator, Object? arguments) {
        return navigator.restorablePush(
          _datePickerRoute,
          arguments: _selectedDate.value.millisecondsSinceEpoch,
        );
      },
    );
    date = DateFormat('d/M/y').format(defaultDate);
  }
  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(2021, 1, 1),
          lastDate: DateTime(2022, 1, 1),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        date ='${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}';
        widget.updateDate( DateTime(_selectedDate.value.year, _selectedDate.value.month, _selectedDate.value.day));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        _restorableDatePickerRouteFuture.present();
      },
      child: Text(
        date,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          color: Colors.black                  
        ),
      ),
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(177, 48),
        textStyle: const TextStyle(fontSize: 16),
        primary: Colors.white,
      ),
    );
  }
}