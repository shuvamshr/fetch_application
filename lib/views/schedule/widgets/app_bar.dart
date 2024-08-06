import 'package:fetch_application/constants/colors.dart';
import 'package:flutter/material.dart';

class FetchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> children;

  const FetchAppBar({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: appBarPrimaryBackground,
      ),
      child: Row(
        children: children,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56.0);
}
