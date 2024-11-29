import 'package:flutter/material.dart';

//Importações das páginas
import '/models/IntegranteCardData.dart'; // Use sempre o mesmo caminho

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
            child: integrante.imagem.contains('http')
                ? Image.network(
                    integrante.imagem,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    integrante.imagem,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
          ),
          SizedBox(height: 8.0),
          Text(
            integrante.nome,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          Text(
            integrante.cargos.join('\n'),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
