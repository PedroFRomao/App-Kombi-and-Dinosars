import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// Importações das páginas
import 'IntegrantePerfil.dart';
import 'fases.dart';
import 'personagens.dart';
import 'controles.dart';

//implementacao dos widges
import 'widgets/custom_footer.dart';
import 'widgets/integranteCard.dart';
import 'widgets/custom_bottom_nav.dart';

//implementacao das classes de info
import '/models/IntegranteCardData.dart';
import '/models/app_colors.dart';

class Historia extends StatefulWidget {
  @override
  _HistoriaState createState() => _HistoriaState();
}

// texto historia jogo
class HistoriaData {
  static const String texto = '''
Após uma guerra nuclear, a humanidade se esconde em bunkers e retorna à superfície após 
séculos, encontrando dinossauros geneticamente modificados devido à radiação. Uma gangue 
chamada CLTS domina uma cidade apocalíptica e é cruel com os habitantes fora dos muros. 
 Seu Zé e seu filho Rogério têm sua casa destruída e decidem consertar uma velha Kombi 
 para sobreviver. Eles se juntam a Enzo e Mirela para desafiar o líder da cidade e 
 enfrentar os perigos dos dinossauros e da gangue. Juntos, enfrentam desafios para 
 sobreviver no novo mundo apocalíptico.
''';
}

class _HistoriaState extends State<Historia> {
  int _selectedIndex = 1; // Controla a aba selecionada
  int integranteIndex = 0; //Controla o list da tela integrantes

  final List<IntegranteCardData> integrantes = [
    IntegranteCardData(
      imagem: 'assets/perfil1.png',
      nome: 'Pedro Romão',
      cargos: ['Diretor Criativo', 'Dev Mobile'],
    ),
    IntegranteCardData(
      imagem:
          'https://github.com/user-attachments/assets/bd078d8d-766a-4fdb-b0c2-a04b25c945eb',
      nome: 'Fernanda Viana',
      cargos: ['Diretora de Arte', 'Ilustradora'],
    ),
    IntegranteCardData(
      imagem:
          'https://github.com/user-attachments/assets/a4adf2bd-8d7f-430c-9b29-4c9db960b425',
      nome: 'Cauã Santos',
      cargos: ['Dev Full Stack', 'Líder Técnico'],
    ),
    IntegranteCardData(
      imagem:
          'https://github.com/user-attachments/assets/b30eccfc-5ecb-4866-98c1-92a398b2152c',
      nome: 'Davi Nascimento',
      cargos: ['Artista 3D', 'Dev Full Stack'],
    ),
    IntegranteCardData(
      imagem:
          'https://github.com/user-attachments/assets/1e7dad10-19c5-4068-8964-953d32b4f006',
      nome: 'Ruan Fernandes',
      cargos: ['Coordenador de Processos', 'Áudio Maker'],
    ),
    IntegranteCardData(
      imagem:
          'https://github.com/user-attachments/assets/7cc9201d-338c-410a-95df-d7ddaf5a41b7',
      nome: 'Gabriel Faria',
      cargos: ['Game Designer', 'Gerente de Operações'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg_appBar, // Cor do BG AppBar
      appBar: AppBar(
        title: Text(
          'História', //Titulo AppBar
          style: TextStyle(
            color: AppColors.title, // Cor do titulo
            fontWeight: FontWeight.bold, //Fonte
          ),
        ),
        backgroundColor: AppColors.bg_appBar, // Cor da AppBar
        automaticallyImplyLeading: false, // Remove o botão de voltar
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5), // Espaco

            // Logo
            Center(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(
                      image: NetworkImage(
                          'https://github.com/user-attachments/assets/6eccdd27-ff70-4135-9b12-2ce63e709a94'),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(width: 5), // Espaco

            // Texto sobre a história do jogo
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Center(
                child: Text(
                  HistoriaData.texto, // Texto da historia
                  textAlign: TextAlign.justify, // Justificado
                  style: TextStyle(
                    fontSize: 15, // Fonte 15
                    color: AppColors.text, // Cor do texto
                  ),
                ),
              ),
            ),

            //HQ
            // Texto sobre o personagem
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Center(
                child: Text(
                  'Conheca a nossa HQ',
                  style: TextStyle(
                    fontSize: 28, // Tamanho do título
                    fontWeight: FontWeight.bold, // Negrito
                    color: AppColors.text, // Cor do texto
                  ),
                ),
              ),
            ),

            // Capa HQ
            Center(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(
                      image: NetworkImage(
                          'https://github.com/user-attachments/assets/6eccdd27-ff70-4135-9b12-2ce63e709a94'),
                      height: 150,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 10), // Espaco

            // Area gub
            Container(
              color: Color(0x4d5fa90c),
              padding: const EdgeInsets.all(5.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.4),
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                ),
                itemCount: integrantes.length,
                itemBuilder: (context, index) {
                  return IntegranteCard(
                    integrante: integrantes[index],
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
              ),
            ),
            // Rodapé
            CustomFooter(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Color(0xff343334), // Cor do fundo da barra de navegação
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
          child: GNav(
            selectedIndex: _selectedIndex,
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
