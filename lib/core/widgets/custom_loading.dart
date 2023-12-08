import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rakna/core/utils/animation_manager.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Lottie.asset(
        AnimationManager.loading,
        repeat: true,
        animate: true,
        
      ),
    );
  }
}