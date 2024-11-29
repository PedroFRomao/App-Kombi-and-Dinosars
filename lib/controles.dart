import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// Importações das páginas
import 'personagens.dart';
import 'fases.dart';
import 'historia.dart';

// textos da pagina
final List<Map<String, String>> fases = [
  {
    'titulo': 'Movimentação do Personagem',
    'descricao':
        'Pressione teclas (W, A, S e D) para fazer o personagem andar.Utilize o mouse para controlar a câmeraDash (Corrida):Pressione as teclas de movimentação (W, A, S, D) junto com o SHIFT esquerdo para correr.',
  },
  {
    'titulo': 'Coletar Itens',
    'descricao': 'Pressione a tecla “F” em cima de um item para coletá-lo.',
  },
  {
    'titulo': 'Ataques',
    'descricao':
        'Ataque simples: Clique com o botão esquerdo do mouse para um ataque simples.',
  },
  {
    'titulo': 'Ataque Dash',
    'descricao':
        'Ataque durante o Dash: Durante o dash, clique com o botão esquerdo do mouse para executar um ataque mais efetivo',
  },
  {
    'titulo': 'Ataque Especial',
    'descricao':
        'Pressione a tecla “E” para executar um ataque especial que atinge todos os inimigos próximos. O jogador fica temporariamente invencível durante este golpe, porém ele tem um tempo de Cooldown (um o tempo até poder utilizar a habilidade novamente) e além disso ela precisa ser carregada com ataques básicos nos inimigos.',
  },
];

class Controles extends StatefulWidget {
  @override
  _ControlesState createState() => _ControlesState();
}

class _ControlesState extends State<Controles> {
  int _selectedIndex = 3; // Controla a aba selecionada

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
                shrinkWrap: true,
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
                      SizedBox(height: 8),
                      Text(
                        fases[index]['descricao']!,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 18),
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
                        fontSize: 12,
                      ),
                    ),
                  ),
                  //
                  SizedBox(width: 13),
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
              // Navega pelas paginas
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
