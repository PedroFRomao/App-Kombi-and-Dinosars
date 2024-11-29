import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';

class IntegrantePerfil {
  final String banner;
  final String fotoPerfil;
  final String nome;
  final String descricao;
  final List<Projeto> projetos;

  IntegrantePerfil({
    required this.banner,
    required this.fotoPerfil,
    required this.nome,
    required this.descricao,
    required this.projetos,
  });
}

class Projeto {
  final String imagem;
  final String link;

  Projeto({
    required this.imagem,
    required this.link,
  });
}

final List<IntegrantePerfil> integrantesData = [
  IntegrantePerfil(
    banner: 'assets/banner1.png',
    fotoPerfil: 'assets/perfil1.png',
    nome: 'Pedro Romão',
    descricao: 'Uma breve descrição',
    projetos: [
      Projeto(
          imagem:
              'https://github.com/user-attachments/assets/e0330ccf-1276-481f-b18b-012e8cae36ac',
          link: 'https://linkprojeto1.com'),
      Projeto(
          imagem:
              'https://github.com/user-attachments/assets/e0330ccf-1276-481f-b18b-012e8cae36ac',
          link: 'https://linkprojeto2.com'),
      Projeto(
          imagem:
              'https://github.com/user-attachments/assets/e0330ccf-1276-481f-b18b-012e8cae36ac',
          link: 'https://linkprojeto3.com'),
      Projeto(
          imagem:
              'https://github.com/user-attachments/assets/e0330ccf-1276-481f-b18b-012e8cae36ac',
          link: 'https://linkprojeto4.com'),
    ],
  ),
  IntegrantePerfil(
    banner: '',
    fotoPerfil: '',
    nome: 'Fernanda Viana',
    descricao: 'Uma breve descrição',
    projetos: [
      Projeto(
          imagem: 'https://linkImagemProjeto1.com',
          link: 'https://linkprojeto1.com'),
      Projeto(
          imagem: 'https://linkImagemProjeto2.com',
          link: 'https://linkprojeto2.com'),
      Projeto(
          imagem: 'https://linkImagemProjeto3.com',
          link: 'https://linkprojeto3.com'),
      Projeto(
          imagem: 'https://linkImagemProjeto4.com',
          link: 'https://linkprojeto4.com'),
    ],
  ),
  IntegrantePerfil(
    banner: 'assets/banner3.png',
    fotoPerfil:
        'https://github.com/user-attachments/assets/bd078d8d-766a-4fdb-b0c2-a04b25c945eb',
    nome: 'Cauã dos Santos',
    descricao: 'Uma breve descrição',
    projetos: [
      Projeto(
          imagem: 'https://linkImagemProjeto1.com',
          link: 'https://linkprojeto1.com'),
      Projeto(
          imagem: 'https://linkImagemProjeto2.com',
          link: 'https://linkprojeto2.com'),
      Projeto(
          imagem: 'https://linkImagemProjeto3.com',
          link: 'https://linkprojeto3.com'),
      Projeto(
          imagem: 'https://linkImagemProjeto4.com',
          link: 'https://linkprojeto4.com'),
    ],
  ),
  IntegrantePerfil(
    banner:
        'https://github.com/user-attachments/assets/c68a8e6a-b641-40ba-9fc7-ec4839a0d93d',
    fotoPerfil:
        'https://github.com/user-attachments/assets/b30eccfc-5ecb-4866-98c1-92a398b2152c',
    nome: 'Davi Nascimento',
    descricao: 'Uma breve descrição',
    projetos: [
      Projeto(
          imagem: 'https://linkImagemProjeto1.com',
          link: 'https://linkprojeto1.com'),
      Projeto(
          imagem: 'https://linkImagemProjeto2.com',
          link: 'https://linkprojeto2.com'),
      Projeto(
          imagem: 'https://linkImagemProjeto3.com',
          link: 'https://linkprojeto3.com'),
      Projeto(
          imagem: 'https://linkImagemProjeto4.com',
          link: 'https://linkprojeto4.com'),
    ],
  ),
  IntegrantePerfil(
    banner: 'assets/banner5.png',
    fotoPerfil: 'assets/perfil5.png',
    nome: 'Ruan Fernandes',
    descricao: 'Uma breve descrição',
    projetos: [
      Projeto(
          imagem: 'https://linkImagemProjeto1.com',
          link: 'https://linkprojeto1.com'),
      Projeto(
          imagem: 'https://linkImagemProjeto2.com',
          link: 'https://linkprojeto2.com'),
      Projeto(
          imagem: 'https://linkImagemProjeto3.com',
          link: 'https://linkprojeto3.com'),
      Projeto(
          imagem: 'https://linkImagemProjeto4.com',
          link: 'https://linkprojeto4.com'),
    ],
  ),
  IntegrantePerfil(
    banner: 'assets/banner6.png',
    fotoPerfil:
        'https://github.com/user-attachments/assets/7cc9201d-338c-410a-95df-d7ddaf5a41b7',
    nome: 'Gabriel Faria',
    descricao: 'Uma breve descrição',
    projetos: [
      Projeto(
          imagem: 'https://linkImagemProjeto1.com',
          link: 'https://linkprojeto1.com'),
      Projeto(
          imagem: 'https://linkImagemProjeto2.com',
          link: 'https://linkprojeto2.com'),
      Projeto(
          imagem: 'https://linkImagemProjeto3.com',
          link: 'https://linkprojeto3.com'),
      Projeto(
          imagem: 'https://linkImagemProjeto4.com',
          link: 'https://linkprojeto4.com'),
    ],
  ),
];

class IntegrantesPage extends StatefulWidget {
  final int integranteIndex;

  IntegrantesPage({required this.integranteIndex});

  @override
  _IntegrantesPageState createState() => _IntegrantesPageState();
}

class _IntegrantesPageState extends State<IntegrantesPage> {
  @override
  Widget build(BuildContext context) {
    // Acessa os dados do integrante atual
    final integrante = integrantesData[widget.integranteIndex];

    return Scaffold(
      backgroundColor: Color(0xff2b2b2b), // Cor de fundo
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //
            // Banner ***
            Stack(
              clipBehavior: Clip.hardEdge,
              fit: StackFit.loose,
              children: [
                Positioned.fill(
                  child: Container(
                    height: 250, // Aumente a altura conforme necessário
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            integrante.banner), // Usa o banner do integrante
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close, color: Color(0xffffffff)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),

            //
            // Área de Informações ***
            Container(
              decoration: BoxDecoration(
                color: Color(0xff2b2b2b),
              ),
              padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal:
                      65), // Menor padding vertical para reduzir a altura
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topLeft,
                    children: [
                      //
                      // Foto de Perfil com Sobreposição ao Banner
                      //
                      Positioned(
                        top:
                            -60, // Ajuste de posição para que metade do avatar fique sobre o banner
                        left: -45,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(integrante
                              .fotoPerfil), // Usa a foto de perfil do integrante
                        ),
                      ),
                      //
                      // Nome e outras informações
                      //
                      Padding(
                        padding: const EdgeInsets.only(
                            left:
                                70), // Deslocamento para que o texto fique à direita do avatar
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              integrante.nome, // Nome do integrante
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //
            SizedBox(height: 10),
            //
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    integrante.descricao, // Descrição do integrante
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),
            //
            // Área de projetos ***
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: integrante.projetos.length, // Número de projetos
              itemBuilder: (context, index) {
                final projeto = integrante.projetos[index];
                return GestureDetector(
                  onTap: () {
                    // Abrir link do projeto ao clicar
                    /*Future<void> _launchURL(String url) async {
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Could not launch $url';
          }
        }*/
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(20), // Mesmo raio do Container
                      child: Stack(
                        children: [
                          Image.network(
                            projeto.imagem, // Imagem do projeto
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                          Container(
                            color: Colors.black.withOpacity(
                                0.5), // Filtro preto semitransparente
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
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
                  SizedBox(width: 15), // Espaçamento entre o texto e a imagem
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
    );
  }
}
