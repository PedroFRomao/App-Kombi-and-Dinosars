import 'package:flutter/material.dart';

// Implementação das classes de info
import '/models/app_colors.dart';

class NavigationDots extends StatelessWidget {
  final int currentIndex;
  final int totalItems;
  final Function(int) onDotTapped;

  NavigationDots({
    required this.currentIndex,
    required this.totalItems,
    required this.onDotTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalItems,
        (index) => GestureDetector(
          onTap: () => onDotTapped(index), // Ação ao clicar na bolinha
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentIndex == index
                  ? AppColors.bolinhaOn
                  : AppColors.bolinhaOff, // Cor da bolinha
            ),
          ),
        ),
      ),
    );
  }
}
