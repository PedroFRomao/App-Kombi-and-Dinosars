import 'package:flutter/material.dart';
import '/models/app_colors.dart';

//CustomFooter
class CustomFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bgRodape,
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              '© 2024 GUB. Todos os direitos reservados. '
              'Todas as marcas comerciais são propriedade dos respetivos proprietários.',
              style: TextStyle(
                color: AppColors.textoRodape,
                fontSize: 13,
              ),
            ),
          ),
          SizedBox(width: 15),
          Image.network(
            'https://github.com/user-attachments/assets/a09f9f93-e9c5-4d14-add7-cb597d277a03',
            width: 45,
            height: 45,
          ),
        ],
      ),
    );
  }
}
