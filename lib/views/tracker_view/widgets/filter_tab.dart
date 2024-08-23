import 'package:fetch_application/utils/constants/colors.dart';
import 'package:fetch_application/utils/constants/typography.dart';
import 'package:fetch_application/models/pet_model.dart';
import 'package:flutter/material.dart';

class FilterTab extends StatelessWidget {
  final Pet pet;
  final bool isActive;

  const FilterTab({super.key, required this.pet, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: EdgeInsets.only(left: pet.id != 'null' ? 8 : 12, right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        color: isActive
            ? filterTabPrimaryBackgroundActive
            : filterTabPrimaryBackgroundInactive,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (pet.id != 'null') ...[
            CircleAvatar(
              radius: 28 / 2,
              backgroundImage:
                  AssetImage('assets/images/pets/${pet.image}.png'),
            ),
            const SizedBox(width: 8),
          ],
          Text(
            pet.id != 'null' ? pet.name : "All Pets",
            style: isActive
                ? filterTabTitleActiveStyle
                : filterTabTitleInactiveStyle,
          )
        ],
      ),
    );
  }
}
