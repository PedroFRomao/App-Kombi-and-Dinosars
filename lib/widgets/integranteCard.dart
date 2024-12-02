import 'package:flutter/material.dart';

// Importações das páginas
import '/models/IntegranteCardData.dart';
import '/models/app_fonts.dart';

// Widget para exibir os integrantes
class IntegranteCard extends StatelessWidget {
  final IntegranteCardData
      integrante; // Alterado para usar a classe de dados correta
  final VoidCallback onTap;

  IntegranteCard({required this.integrante, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(height: 10),
          ClipOval(
            child: Image.asset(
              integrante.imagem,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            integrante.nome,
            textAlign: TextAlign.center, // centralizado
            style: AppFonts.textoNegrito, // Usando o estilo de texto
          ),
          Text(
            integrante.cargos.join('\n'),
            textAlign: TextAlign.center, // centralizado
            style: AppFonts.texto, // Usando o estilo de texto
          ),
        ],
      ),
    );
  }
}
