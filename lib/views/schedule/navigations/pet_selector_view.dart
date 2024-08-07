import 'package:fetch_application/constants/colors.dart';
import 'package:fetch_application/constants/icons.dart';
import 'package:fetch_application/constants/typography.dart';
import 'package:fetch_application/models/pet_model.dart';
import 'package:fetch_application/views/schedule/widgets/app_bar.dart';
import 'package:fetch_application/views/schedule/widgets/app_body.dart';
import 'package:fetch_application/views/schedule/widgets/form_section.dart';
import 'package:fetch_application/views/schedule/widgets/option_tile.dart';
import 'package:flutter/material.dart';

class PetSelectorView extends StatelessWidget {
  final List<Pet> pets;
  final Pet selectedPet;
  final Function(Pet) onOptionSelected;

  const PetSelectorView({
    super.key,
    required this.pets,
    required this.selectedPet,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appBodyPrimaryBackground,
        appBar: FetchAppBar(
          children: [
            IconButton(
                onPressed: () => Navigator.pop(context), icon: leftArrowIcon),
            const Spacer(),
            Text("Select Pet", style: appBarTitleStyle),
            const Spacer(),
          ],
        ),
        body: FetchAppBody(
          children: [
            FormSection(
              children: [
                for (var pet in pets) ...[
                  GestureDetector(
                    onTap: () => {
                      onOptionSelected(pet),
                      Navigator.pop(context),
                    },
                    child: OptionTile(
                      title: pet.name,
                      type: 'pets',
                      image: pet.image,
                      isSelected: selectedPet == pet,
                    ),
                  )
                ],
              ],
            ),
          ],
        ));
  }
}
