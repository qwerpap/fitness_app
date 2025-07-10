import 'package:fitness_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

final primaryColor = AppColors.primaryColor;

final theme = ThemeData.dark().copyWith(
  primaryColor: primaryColor,
  colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
);
