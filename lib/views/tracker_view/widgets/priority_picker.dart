import 'package:fetch_application/constants/colors.dart';
import 'package:fetch_application/constants/typography.dart';
import 'package:fetch_application/views/tracker_view/widgets/form_tile.dart';
import 'package:flutter/cupertino.dart';

class PriorityPicker extends StatelessWidget {
  final String initialPriority;
  final ValueChanged<String> onPrioritySelected;

  final List<String> priorities = [
    "Low",
    "Medium",
    "High",
  ];

  PriorityPicker(
      {super.key,
      required this.initialPriority,
      required this.onPrioritySelected});

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
                    onPrioritySelected(priorities[val]);
                  },
                  children:
                      priorities.map((priority) => Text(priority)).toList(),
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
        type: "priority",
        label: "Priority",
        selection: initialPriority,
      ),
    );
  }
}
