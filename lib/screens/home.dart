import 'package:flutter/material.dart';

// Implementação dos widgets
import '/widgets/customFooter.dart';
import '/widgets/integranteCard.dart';
import '/widgets/integrantePerfil.dart';
import '/widgets/customAppBar.dart';
import '/widgets/customBottomNavBar.dart';
import '/widgets/HQ.dart';

// Implementação das classes de Data
import '/models/app_colors.dart';
import '/models/app_fonts.dart';
import '/models/IntegranteCardData.dart';
import '/models/homeData.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 1; // Controla a aba selecionada
  int integranteIndex = 0; // Controla o índice da lista de integrantes

  @override
  Widget build(BuildContext context) {
    // Obtém a instância dos dados
    final homeData = HomeData.instance;

    return Scaffold(
      backgroundColor: AppColors.bg, // Cor de fundo
      appBar: CustomAppBar(title: 'Home'), // Apenas muda o título
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10), // Espaço

            // Sinopse
            Center(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo
                    Image.asset(
                      homeData.logoJogo,
                    ),
                    SizedBox(height: 20), // Espaço

                    // História
                    Text(
                      HomeData.instance.texto, // Sinopse
                      textAlign: TextAlign.justify,
                      style: AppFonts.texto, // Usando o estilo de texto
                    ),
                  ],
                ),
              ),
            ),

            // HQ
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      HomeData.instance.hqTitulo,
                      style: AppFonts.title,
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                HQPage(), // Navega para a página HQ
                          ),
                        );
                      },
                      child: Image.asset(
                        homeData.hqImagem,
                        width: 150,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 30), // Espaço

            // Área GUB
            Container(
              color: const Color(0x4d5fa90c), // Cor verde
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Título acima do conteúdo
                    Text(
                      HomeData.instance.gubTitulo, // Título
                      style: AppFonts.title,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),

                    // Grid de integrantes
                    LayoutBuilder(
                      builder: (context, constraints) {
                        int crossAxisCount = 2;

                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount,
                            childAspectRatio: 1, // Ajusta a proporção dos cards
                            mainAxisSpacing: 10.0,
                            crossAxisSpacing: 10.0,
                          ),
                          itemCount: IntegrantesData.integrantes.length,
                          itemBuilder: (context, index) {
                            return IntegranteCard(
                              integrante: IntegrantesData.integrantes[index],
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => IntegrantesPage(
                                      integranteIndex: index,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 20),

                    // Botão abaixo do grid
                    ElevatedButton(
                      onPressed: () {
                        // Ação do botão
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.iconOn,
                        foregroundColor: AppColors.text,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 30.0),
                        textStyle: const TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      child: const Text("Site GUB"),
                    ),
                  ],
                ),
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
