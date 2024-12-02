import 'package:flutter/material.dart';
import '/models/app_colors.dart';
import '/models/app_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppFonts.titleAppBar, // Usando o estilo de texto
      ),
      backgroundColor: AppColors.bgAppBar, // Cor de fundo
      automaticallyImplyLeading: false, // Remove o botão de voltar
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
