import 'package:flutter/material.dart';
import 'package:nanen_mission/misc/colors.dart';

final ButtonStyle buttonPrimary = ElevatedButton.styleFrom(
  minimumSize: const Size(327, 50),
  backgroundColor: AppColors.softPurple,
  elevation: 0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(50)),
  ),
);
