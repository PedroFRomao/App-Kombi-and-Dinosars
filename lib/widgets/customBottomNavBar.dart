import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '/models/app_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabChange;

  CustomBottomNavBar({required this.selectedIndex, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bgAppBar, // Cor do fundo da barra de navegação
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
        child: GNav(
          selectedIndex: selectedIndex,
          color: AppColors.iconOff, // Botão desligado
          activeColor: AppColors.iconOn, // Botão ligado
          tabBackgroundColor: AppColors.iconLigth, // Luz do botão ligado
          gap: 8,
          onTabChange: onTabChange,
          padding: EdgeInsets.all(8),
          tabs: [
            GButton(
              icon: Icons.person,
              onPressed: () {
                Navigator.pushNamed(context, '/personagens');
              },
            ),
            GButton(
              icon: Icons.description,
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            GButton(
              icon: Icons.map,
              onPressed: () {
                Navigator.pushNamed(context, '/fases');
              },
            ),
            GButton(
              icon: Icons.videogame_asset,
              onPressed: () {
                Navigator.pushNamed(context, '/controles');
              },
            ),
          ],
        ),
      ),
    );
  }
}
