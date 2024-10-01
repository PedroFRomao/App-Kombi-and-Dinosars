import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// Importações das páginas
import 'personagens.dart';
import 'fases.dart';
import 'historia.dart';

// textos da pagina
final List<Map<String, String>> fases = [
  {
    'titulo': 'Titulo 1',
    'descricao':
        'Nosso Agroboy tem um forte senso de responsabilidade e faz o possível para proteger aqueles que ama. Ele é prático e prefere ação direta, mas sabe quando é necessário ser cuidadoso.',
  },
  {
    'titulo': 'Titulo 2',
    'descricao': 'texto 2',
  },
  {
    'titulo': 'Titulo 3',
    'descricao': 'texto 3',
  },
  {
    'titulo': 'Titulo 4',
    'descricao': 'texto 4',
  },
  {
    'titulo': 'Titulo 5',
    'descricao': 'texto 5',
  },
];

class Controles extends StatefulWidget {
  @override
  _ControlesState createState() => _ControlesState();
}

class _ControlesState extends State<Controles> {
  int _selectedIndex =
      3; // Controla a aba selecionada, inicia com a aba "Controles"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2b2b2b), // Cor de fundo
      appBar: AppBar(
        title: const Text(
          'Controles',
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
            SizedBox(height: 10),

            // Lista de Títulos e Descrições
            Padding(
              padding: EdgeInsets.all(16.0),
              child: ListView.builder(
                shrinkWrap: true, // Para que o ListView não ocupe espaço extra
                physics: NeverScrollableScrollPhysics(), // Desabilita o scroll
                itemCount: fases.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        fases[index]['titulo']!,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        fases[index]['descricao']!,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 20),
                    ],
                  );
                },
              ),
            ),

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
            selectedIndex: _selectedIndex, // Define a aba ativa
            color: Color(0x85000000),
            activeColor: Color(0xffabd904),
            tabBackgroundColor: Color(0x4d5fa90c),
            gap: 8,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
              // Navega para a página correspondente
              if (index == 0) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Personagens()));
              } else if (index == 1) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Historia()));
              } else if (index == 2) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Fases()));
              } else if (index == 3) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Controles()));
              }
            },
            padding: EdgeInsets.all(8),
            tabs: [
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
