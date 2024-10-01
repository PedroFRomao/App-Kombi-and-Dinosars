import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// Importações das páginas
import 'historia.dart';
import 'fases.dart';
import 'controles.dart';

class Personagens extends StatefulWidget {
  @override
  _PersonagensState createState() => _PersonagensState();
}

class _PersonagensState extends State<Personagens> {
  int _currentIndex = 0;
  int _selectedIndex = 0; // Variável para controlar a aba selecionada
  final CarouselController _carouselController = CarouselController();

  // Carrossel dos personagens
  final List<Map<String, String>> fases = [
    {
      'titulo': 'Jeronimo',
      'imagem':
          'https://github.com/user-attachments/assets/097cf1ae-c01e-4835-9095-5e26e353dfc2',
      'sobrePersonagem':
          'Nosso Agroboy tem um forte senso de responsabilidade e faz o possível para proteger aqueles que ama. Ele é prático e prefere ação direta, mas sabe quando é necessário ser cuidadoso.',
      'ferramenta': 'Jeronimo irá ter uma Enxada como ferramenta especial',
      'imagemFerramenta':
          'https://github.com/user-attachments/assets/602d2d39-bca2-48f6-937c-acc1846226d1',
    },
    {
      'titulo': 'Seu Zé',
      'imagem':
          'https://github.com/user-attachments/assets/e3d1ce28-0d48-4d10-9d77-8449ffd7a709',
      'sobrePersonagem': 'Informações sobre o personagem na Fase 2.',
      'ferramenta': 'Ferramenta usada na Fase 2.',
      'imagemFerramenta':
          //LEMBRA DE TROCAR PARA O DO SEU ZE
          'https://github.com/user-attachments/assets/602d2d39-bca2-48f6-937c-acc1846226d1',
    },
    {
      'titulo': 'Mirela',
      'imagem':
          'https://github.com/user-attachments/assets/cf52d2f5-cbcc-4a45-8c3f-2ab0fd2fc9a9',
      'sobrePersonagem': 'Informações sobre o personagem na Fase 3.',
      'ferramenta': 'Ferramenta usada na Fase 3.',
      'imagemFerramenta':
          //LEMBRA DE TROCAR PARA A DA MIRELA
          'https://github.com/user-attachments/assets/602d2d39-bca2-48f6-937c-acc1846226d1',
    },
    {
      'titulo': 'Enzo',
      'imagem':
          'https://github.com/user-attachments/assets/2f6ef1ef-4b1a-40eb-8e16-033eda35ffc7',
      'sobrePersonagem': 'Informações sobre o personagem na Fase 4.',
      'ferramenta': 'Ferramenta usada na Fase 4.',
      'imagemFerramenta':
          //LEMBRA DE TROCAR PARA O DO ENZO
          'https://github.com/user-attachments/assets/602d2d39-bca2-48f6-937c-acc1846226d1',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2b2b2b), // Cor de fundo
      appBar: AppBar(
        title: Text(
          'Personagens',
          style: TextStyle(
            color: Color(0xffabd904),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xff343334), // Cor da AppBar
        automaticallyImplyLeading: false, // Remove o botão de voltar
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Carrossel
            CarouselSlider.builder(
              carouselController: _carouselController,
              itemCount: fases.length,
              itemBuilder: (context, index, realIndex) {
                return Column(
                  children: [
                    SizedBox(height: 10),
                    Text(
                      fases[index]['titulo']!,
                      style: TextStyle(
                        fontSize: 28, // Tamanho do título
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Image.network(
                      fases[index]['imagem']!,
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

            // Bolinhas de navegação
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                fases.length,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = index;
                    });
                    _carouselController.animateToPage(index);
                  },
                  child: Container(
                    width: 12,
                    height: 12,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index
                          ? Color(0xffabd904) // Cor da bolinha ativa
                          : Color(0xa19e9e9e), // Cor da bolinha inativa
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            // Texto sobre o personagem
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  'Sobre o Personagem',
                  style: TextStyle(
                    fontSize: 22, // Tamanho do título
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                fases[_currentIndex]['sobrePersonagem']!,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: Colors.white, fontSize: 15), // Tamanho do texto
              ),
            ),

            SizedBox(height: 10),

            // Título da ferramenta
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  'Ferramenta',
                  style: TextStyle(
                    fontSize: 20, // Tamanho do título
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Center(
                    // Centraliza a imagem da ferramenta
                    child: Image.network(
                      fases[_currentIndex]['imagemFerramenta']!,
                      height: 100,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    fases[_currentIndex]['ferramenta']!,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Colors.white, fontSize: 15), // Tamanho do texto
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Rodapé
            Container(
              color: Colors.black,
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      '© 2024 GUB. Todos os direitos reservados. '
                      'Todas as marcas comerciais são propriedade dos respetivos proprietários.',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12, // Tamanho do texto do rodapé
                      ),
                    ),
                  ),
                  SizedBox(width: 15), // Espaçamento entre o texto e a imagem
                  Image.network(
                    'https://github.com/user-attachments/assets/a09f9f93-e9c5-4d14-add7-cb597d277a03',
                    width: 45, // Reduzir o tamanho da imagem
                    height: 45, // Manter a proporção
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        color: Color(0xff343334), // Cor do fundo da barra de navegação
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
          child: GNav(
            selectedIndex:
                _selectedIndex, // Define a aba ativa como o terceiro ícone
            color: Color(0x85000000),
            activeColor: Color(0xffabd904),
            tabBackgroundColor: Color(0x4d5fa90c),
            gap: 8,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            padding: EdgeInsets.all(8),
            tabs: [
              GButton(
                  icon: Icons.person,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Personagens()));
                  }),
              GButton(
                  icon: Icons.description,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Historia()));
                  }),
              GButton(
                  icon: Icons.map,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Fases()));
                  }),
              GButton(
                  icon: Icons.videogame_asset,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Controles()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
