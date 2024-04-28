import 'package:flutter/material.dart';

import '../../../../core/theme/manager/colors_manager.dart';

class CustomAddVehicleIcon extends StatelessWidget {
  const CustomAddVehicleIcon({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 18),
        child: const CircleAvatar(
          backgroundColor: ColorsManager.white,
          radius: 12,
          child: Icon(
            Icons.add,
            color: ColorsManager.bluishClr,
            size: 18,
          ),
        ),
      ),
    );
  }
}
