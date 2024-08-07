import 'package:fetch_application/constants/colors.dart';
import 'package:fetch_application/constants/typography.dart';
import 'package:fetch_application/views/schedule/widgets/form_tile.dart';
import 'package:flutter/cupertino.dart';

class FrequencyPicker extends StatelessWidget {
  final String initialFrequency;
  final ValueChanged<String> onFrequencySelected;

  final List<String> frequencies = [
    "One Time",
    "Daily",
    "Weekly",
    "Fortnightly",
    "Monthly",
    "Yearly"
  ];

  FrequencyPicker(
      {super.key,
      required this.initialFrequency,
      required this.onFrequencySelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
          height: 250,
          color: pickerPrimaryBackground,
          child: Column(
            children: [
              SizedBox(
                height: 180,
                child: CupertinoPicker(
                  itemExtent: 32.0,
                  onSelectedItemChanged: (val) {
                    onFrequencySelected(frequencies[val]);
                  },
                  children:
                      frequencies.map((frequency) => Text(frequency)).toList(),
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
        type: "frequency",
        label: "Frequency",
        selection: initialFrequency,
      ),
    );
  }
}
