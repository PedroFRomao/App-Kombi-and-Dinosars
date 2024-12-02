import 'package:flutter/material.dart';

// Implementação dos widgets
import '/widgets/customFooter.dart';

// Implementação das classes de Data
import '/models/integrantePerfilData.dart';
import '/models/app_colors.dart';
import '/models/app_fonts.dart';

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
      backgroundColor: AppColors.bg, // Cor de fundo
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                  icon: Icon(Icons.close, color: AppColors.text),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),

            // Área de Informações ***
            Container(
              decoration: BoxDecoration(
                color: AppColors.bg,
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
                      // Foto de Perfil com Sobreposição ao Banner
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
                      // Nome e outras informações
                      Padding(
                        padding: const EdgeInsets.only(
                            left:
                                70), // Deslocamento para que o texto fique à direita do avatar
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(integrante.nome, // Nome do integrante
                                style: AppFonts.title),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),

            // Descrição do integrante ***
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                integrante.descricao, // Descrição do integrante
                style: AppFonts.texto,
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: 10),

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
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(20), // Mesmo raio do Container
                    child: Stack(
                      children: [
                        Image.asset(
                          projeto.imagem, // Imagem do projeto
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                        Container(
                          color: Colors.black.withOpacity(
                              0.5), // Filtro preto semitransparente
                        ),
                        Positioned(
                          bottom: 10,
                          left: 10,
                          right: 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(projeto.titulo, // Título do projeto
                                  style: AppFonts.textoNegritomini),
                              SizedBox(height: 4),
                              Text(
                                projeto.descricao, // Descrição do projeto
                                style: AppFonts.textomini,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            // Rodapé
            CustomFooter(),
          ],
        ),
      ),
    );
  }
}
