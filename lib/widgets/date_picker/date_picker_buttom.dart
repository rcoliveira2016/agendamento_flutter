import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:agendamentos/shared/extension/date_time_extension.dart';

typedef ChangeDate = void Function(DateTime newValue);

class DatePickerButtom extends StatefulWidget {
  DateTime initialDate;
  ChangeDate onChage;

  DatePickerButtom({this.initialDate, this.onChage});

  @override
  _DatePickerButtomState createState() => _DatePickerButtomState();
}

class _DatePickerButtomState extends State<DatePickerButtom> {
  @override
  Widget build(BuildContext context) {
    widget.initialDate = widget.initialDate ?? DateTime.now();
    return Container(
      child: RaisedButton(
        elevation: 0,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        color: Colors.transparent,
        child: Row(
          children: <Widget>[
            Icon(Icons.calendar_today),
            SizedBox(
              width: 25,
            ),
            Text(
              widget.initialDate.formatar(DateFormat.YEAR_MONTH_DAY),
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
        onPressed: () {
          var picked = showDatePicker(
              context: context,
              initialDate: widget.initialDate,
              firstDate: DateTime(2017),
              lastDate: DateTime(2100));
          picked.then(widget.onChage);
        },
      ),
    );
  }
}
