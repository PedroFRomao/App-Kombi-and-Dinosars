import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// Importações das páginas
import 'historia.dart';
import 'personagens.dart';
import 'controles.dart';

class Fases extends StatefulWidget {
  @override
  _FasesState createState() => _FasesState();
}

class _FasesState extends State<Fases> {
  int _currentIndex = 0;
  int _selectedIndex = 2; // Define o índice da aba
  final CarouselController _carouselController = CarouselController();

  // Carrossel das fases
  final List<Map<String, String>> fases = [
    {
      'titulo': 'Posto de gasolina',
      'imagemFase':
          'https://github.com/user-attachments/assets/e33db5f2-e7cf-40f1-b8d5-0b8ca22c622e',
      'sobreFase':
          'Fugindo dos dinossauros que destruíram seu abrigo, Seu Zé e Rogério encontram uma Kombi em um posto mecânico abandonado e decidem consertá-la. Enquanto Seu Zé conserta a Kombi, Rogério protege ambos dos dinossauros e de membros da gangue que surgiram enquanto coleta itens que ajudam no conserto..',
    },
    {
      'titulo': 'O Mercado Abandonado',
      'imagemFase':
          'https://github.com/user-attachments/assets/876d417a-bed1-4bd6-86b9-b5a783f86ca8',
      'sobreFase':
          'Ao saírem do posto com a Kombi, Seu Zé e Rogério chegam a uma cidade completamente destruída e encontram um mercado, eles decidem descer do veículo e ir em busca de suplementos. Ao entrarem no mercado, veem diversos membros da gangue atacando uma menina e decidem salvá-la.',
    },
    {
      'titulo': 'Perseguição na cidade',
      'imagemFase':
          'https://github.com/user-attachments/assets/b525e6ed-0148-4bab-a384-e991d8182747',
      'sobreFase':
          'Seu Zé e Rogério junto com Mirela vão em busca de salvar o namorado dela (Enzo) que foi pego pela gangue. Enzo é sequestrado em um veículo da gangue, os personagens na Kombi devem perseguir e destruir os veículos colidindo com eles, se ele demorar pra resgatar o Enzo, a gangue consegue escapar.',
    },
    {
      'titulo': 'Invasão à Base dos Punks',
      'imagemFase':
          'https://github.com/user-attachments/assets/d8033460-1d3c-4c48-86f3-67992411955f',
      'sobreFase':
          'Grupo totalmente unido vai em busca de invadir a cidade onde vive o líder da gangue. Para entrar eles precisam derrotar membros da gangue e descobrir a localização do chefe dos “CLTS”..',
    },
    {
      'titulo': 'A Batalha Final',
      'imagemFase':
          'https://github.com/user-attachments/assets/f8d13af8-86aa-49a3-a041-497cbcc7982e',
      'sobreFase':
          'O grupo encontra o chefe final e lá começa a batalha pela liberdade.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2b2b2b), // Cor de fundo
      appBar: AppBar(
        title: const Text(
          'Fases',
          style: TextStyle(
            color: Color(0xffabd904),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xff343334), // Cor da AppBar
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
                    SizedBox(height: 9),
                    Text(
                      fases[index]['titulo']!,
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 9),
                    Image.network(
                      fases[index]['imagemFase']!,
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

            SizedBox(height: 19),

            // Texto sobre o personagem

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                fases[_currentIndex]['sobreFase']!,
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),

            SizedBox(height: 19),

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
                        fontSize: 12,
                      ),
                    ),
                  ),
                  //
                  SizedBox(width: 15),
                  //
                  Image.network(
                    'https://github.com/user-attachments/assets/a09f9f93-e9c5-4d14-add7-cb597d277a03',
                    width: 45,
                    height: 45,
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
            selectedIndex: _selectedIndex, // Define a aba ativa
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
