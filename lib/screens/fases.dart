import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

// Implementação dos widgets
import '/widgets/customFooter.dart';
import '/widgets/customBottomNavBar.dart';
import '/widgets/customAppBar.dart';
import '/widgets/navigationDots.dart'; // Importando o widget NavigationDots

// Implementação das classes de info
import '/models/app_colors.dart';
import '/models/app_fonts.dart';
import '/models/fasesData.dart';

class Fases extends StatefulWidget {
  @override
  _FasesState createState() => _FasesState();
}

class _FasesState extends State<Fases> {
  int _currentIndex = 0;
  int _selectedIndex = 2; // Define o índice da aba
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg, // Cor de fundo
      appBar: CustomAppBar(title: 'Fases'), // Apenas muda o título
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Carrossel
            CarouselSlider.builder(
              carouselController: _carouselController,
              itemCount: FasesData.fases.length,
              itemBuilder: (context, index, realIndex) {
                return Column(
                  children: [
                    SizedBox(height: 9),
                    Text(FasesData.fases[index].titulo, style: AppFonts.title),
                    SizedBox(height: 9),
                    Image.asset(
                      FasesData.fases[index].imagemFase,
                      height: 200,
                    ),
                  ],
                );
              },
              options: CarouselOptions(
                height: 300,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),

            // bolhinhas do carrossel
            NavigationDots(
              currentIndex: _currentIndex,
              totalItems: FasesData.fases.length,
              onDotTapped: (index) {
                setState(() {
                  _currentIndex = index;
                });
                _carouselController.animateToPage(index);
              },
            ),

            SizedBox(height: 20),

            // Texto sobre o personagem
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(FasesData.fases[_currentIndex].sobreFase,
                  textAlign: TextAlign.justify, style: AppFonts.texto),
            ),

            SizedBox(height: 20),

            // Rodapé
            CustomFooter(),
          ],
        ),
      ),

      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
