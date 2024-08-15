import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// Importações das páginas
import 'personagens.dart';
import 'fases.dart';
import 'historia.dart';

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
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0), // Adiciona gap nas laterais
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Títulos e textos
              const SizedBox(height: 20),
              const Text(
                'Título 1',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Texto',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),
              const Text(
                'Título 2',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Texto',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),
              const Text(
                'Título 3',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Texto',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),
              const Text(
                'Título 4',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Texto',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),
              const Text(
                'Título 5',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Texto',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),

      // Rodapé e barra de navegação no mesmo lugar
      bottomNavigationBar: Column(
        mainAxisSize:
            MainAxisSize.min, // Garante que o espaço do rodapé não se expanda
        children: [
          Container(
            color: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0), // Para dar um leve espaço na esquerda
                    child: Text(
                      '© 2024 GUB. Todos os direitos reservados. '
                      'Todas as marcas comerciais são propriedade dos respetivos proprietários.',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12, // Tamanho do texto do rodapé
                      ),
                    ),
                  ),
                ),
                Image.network(
                  'https://github.com/user-attachments/assets/a09f9f93-e9c5-4d14-add7-cb597d277a03',
                  width: 45, // Tamanho da imagem
                  height: 45, // Manter a proporção
                ),
              ],
            ),
          ),
          Container(
            color:
                const Color(0xff343334), // Cor do fundo da barra de navegação
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
              child: GNav(
                selectedIndex: _selectedIndex, // Define a aba ativa
                color: const Color(0x85000000),
                activeColor: const Color(0xffabd904),
                tabBackgroundColor: const Color(0x4d5fa90c),
                gap: 8,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                padding: const EdgeInsets.all(8),
                tabs: [
                  GButton(
                    icon: Icons.person,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Personagens()));
                    },
                  ),
                  GButton(
                    icon: Icons.description,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Historia()));
                    },
                  ),
                  GButton(
                    icon: Icons.map,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Fases()));
                    },
                  ),
                  GButton(
                    icon: Icons.videogame_asset,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Controles()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
