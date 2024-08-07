import 'package:fetch_application/constants/colors.dart';
import 'package:fetch_application/constants/typography.dart';
import 'package:fetch_application/views/schedule/widgets/form_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatelessWidget {
  final DateTime initialDate;
  final ValueChanged<DateTime> onDateSelected;

  const DatePicker(
      {super.key, required this.initialDate, required this.onDateSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
          height: 250,
          color: white,
          child: Column(
            children: [
              SizedBox(
                height: 180,
                child: CupertinoDatePicker(
                  initialDateTime: initialDate,
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: (val) {
                    DateTime selectedDateTime =
                        DateTime(val.year, val.month, val.day, 6, 0);
                    onDateSelected(selectedDateTime);
                  },
                ),
              ),
              // Close the modal
              CupertinoButton(
                child: Text('Done', style: pickerButtonStyle),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ),
      ),
      child: FormTile(
        type: "dateTime",
        label: "Date",
        selection: DateFormat('dd MMM yyyy').format(initialDate),
      ),
    );
  }
}
