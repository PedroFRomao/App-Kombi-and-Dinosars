import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// Importações das páginas
import '/personagens.dart';
import '/historia.dart';
import '/fases.dart';
import '/controles.dart';

// Implementação dos modelos de cores
import '/models/app_colors.dart';

class CustomBottomNav extends StatefulWidget {
  @override
  _CustomBottomNavState createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  // Definindo o índice da aba selecionada
  int _selectedIndex = 0;

  // Lista das páginas
  final List<Widget> _pages = [
    Personagens(),
    Historia(),
    Fases(),
    Controles(),
  ];

  // Função de alteração de aba
  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jogo - Navegação"),
        backgroundColor: AppColors.bg_appBar,
      ),
      body: IndexedStack(
        index: _selectedIndex, // Muda a tela de acordo com o índice
        children: _pages, // Lista das páginas a serem exibidas
      ),
      bottomNavigationBar: Container(
        color: AppColors.bg_appBar, // Cor BG AppBar
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
          child: GNav(
            selectedIndex: _selectedIndex, // Índice da aba selecionada
            color: AppColors.icon_off, // Cor do ícone inativo
            activeColor: AppColors.icon_on, // Cor do ícone ativo
            tabBackgroundColor:
                AppColors.icon_ligth, // Cor de fundo do ícone ativo
            gap: 8,
            onTabChange: _onTabChange, // Passa a função para alterar o índice
            padding: const EdgeInsets.all(8),
            tabs: const [
              GButton(
                icon: Icons.person,
              ),
              GButton(
                icon: Icons.description,
              ),
              GButton(
                icon: Icons.map,
              ),
              GButton(
                icon: Icons.videogame_asset,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
