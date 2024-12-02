import 'package:flutter/material.dart';

// Implementação dos widgets
import '/widgets/customFooter.dart';
import '/widgets/customBottomNavBar.dart';
import '/widgets/customAppBar.dart';

// Implementação das classes de info
import '/models/app_colors.dart';
import '/models/app_fonts.dart';
import '/models/controlesData.dart'; // Agora importando a classe ControlesData

class Controles extends StatefulWidget {
  @override
  _ControlesState createState() => _ControlesState();
}

class _ControlesState extends State<Controles> {
  int _selectedIndex = 3; // Controla a aba selecionada

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg, // Cor de fundo
      appBar:
          CustomAppBar(title: 'Controles'), // Mudando o título para 'Controles'
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),

            // Lista de Títulos e Descrições
            Padding(
              padding: EdgeInsets.all(16.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: ControlesData
                    .controles.length, // Usando ControlesData.controles
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ControlesData.controles[index][
                            'tituloControles']!, // Acessando o título corretamente
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.text,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        ControlesData.controles[index][
                            'descricaoControles']!, // Acessando a descrição corretamente
                        style: AppFonts.texto,
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 18),
                      // Centralizando a imagem com altura definida
                      Center(
                        child: Image.asset(
                          ControlesData.controles[index][
                              'imagemControles']!, // Acessando a imagem corretamente
                          height: 100, // Definindo a altura da imagem
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 18),
                    ],
                  );
                },
              ),
            ),
            // Rodapé
            CustomFooter(),
          ],
        ),
      ),

      bottomNavigationBar: CustomBottomNavBar(
        // Usando o widget CustomBottomNavBar
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
