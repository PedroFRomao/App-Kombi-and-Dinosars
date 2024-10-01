import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// Importações das páginas
import 'personagens.dart';
import 'fases.dart';
import 'controles.dart';

class Historia extends StatefulWidget {
  @override
  _HistoriaState createState() => _HistoriaState();
}

class _HistoriaState extends State<Historia> {
  int _selectedIndex =
      1; // Controla a aba selecionada, inicia com a aba "História"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2b2b2b), // Cor de fundo
      appBar: AppBar(
        title: Text(
          'História',
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
            SizedBox(height: 20),

            //imagme
            //PODE SER ALTERADO PARA O TRAILER
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.all(20.0), // Adiciona espaço nas bordas
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Imagem
                      const Image(
                        image: NetworkImage(
                            'https://github.com/user-attachments/assets/6eccdd27-ff70-4135-9b12-2ce63e709a94'),
                      ),
                      // Ajuste o tamanho do espaço para evitar overflow
                    ],
                  ),
                ),
              ),
            ),

            // Texto sobre a história do jogo
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  'Após uma guerra nuclear, a humanidade se esconde em bunkers e retorna à superfície após séculos, encontrando dinossauros geneticamente modificados devido à radiação. Uma gangue chamada CLTS domina uma cidade apocalíptica e é cruel com os habitantes fora dos muros. Seu Zé e seu filho Rogério têm sua casa destruída e decidem consertar uma velha Kombi para sobreviver. Eles se juntam a Enzo e Mirela para desafiar o líder da cidade e enfrentar os perigos dos dinossauros e da gangue. Juntos, enfrentam desafios para sobreviver no novo mundo apocalíptico.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
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
