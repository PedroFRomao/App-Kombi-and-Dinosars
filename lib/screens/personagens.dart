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
import '/models/PersonagensData.dart';

class Personagens extends StatefulWidget {
  @override
  _PersonagensState createState() => _PersonagensState();
}

class _PersonagensState extends State<Personagens> {
  int _currentIndex = 0;
  int _selectedIndex = 0; // Controla a aba selecionada
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg, // Cor de fundo
      appBar: CustomAppBar(title: 'Personagens'), // Apenas muda o título
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Carrossel
            CarouselSlider.builder(
              carouselController: _carouselController,
              itemCount: PersonagensData
                  .fases.length, // Usando a classe PersonagensData
              itemBuilder: (context, index, realIndex) {
                final personagem = PersonagensData
                    .fases[index]; // Acessa o personagem diretamente
                return Column(
                  children: [
                    SizedBox(height: 10),
                    Text(personagem.titulo,
                        style:
                            AppFonts.title), // Acessando diretamente o título
                    SizedBox(height: 10),
                    Image.asset(
                      personagem.imagem, // Acessando a imagem
                      height: 190,
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

            // Bolinhas do carrossel
            NavigationDots(
              currentIndex: _currentIndex,
              totalItems: PersonagensData
                  .fases.length, // Usando a classe PersonagensData
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
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Text('Sobre o Personagem', style: AppFonts.title),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                PersonagensData.fases[_currentIndex]
                    .sobrePersonagem, // Acessando o sobrePersonagem
                textAlign: TextAlign.justify,
                style: AppFonts.texto,
              ),
            ),

            SizedBox(height: 10),

            // Título da ferramenta
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Text('Ferramenta', style: AppFonts.title),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      PersonagensData.fases[_currentIndex]
                          .imagemFerramenta, // Acessando a imagemFerramenta
                      height: 100,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    PersonagensData.fases[_currentIndex]
                        .ferramenta, // Acessando a ferramenta
                    textAlign: TextAlign.justify,
                    style: AppFonts.texto,
                  ),
                ],
              ),
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
