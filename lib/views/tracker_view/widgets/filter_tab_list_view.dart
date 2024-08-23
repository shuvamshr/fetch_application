import 'package:fetch_application/models/pet_model.dart';
import 'package:fetch_application/views/tracker_view/widgets/filter_tab.dart';
import 'package:flutter/material.dart';

class FilterTabListView extends StatelessWidget {
  final List<Pet> pets;
  final Pet activePet;
  final Function(Pet) onTabSelected;

  const FilterTabListView({
    super.key,
    required this.pets,
    required this.onTabSelected,
    required this.activePet,
  });

  @override
  Widget build(BuildContext context) {
    final allPets = Pet.nullValue();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 16),
            GestureDetector(
              onTap: () => onTabSelected(allPets),
              child: FilterTab(
                pet: allPets,
                isActive: activePet.id == allPets.id,
              ),
            ),
            for (var pet in pets)
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: GestureDetector(
                  onTap: () => onTabSelected(pet),
                  child: FilterTab(
                    pet: pet,
                    isActive: activePet.id == pet.id,
                  ),
                ),
              ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
