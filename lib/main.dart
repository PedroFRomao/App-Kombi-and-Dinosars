import 'package:flutter/material.dart';
import 'personagens.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  runApp(GameApp());
}

class GameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GameHomeScreen(),
    );
  }
}

class GameHomeScreen extends StatefulWidget {
  @override
  _GameHomeScreenState createState() => _GameHomeScreenState();
}

class _GameHomeScreenState extends State<GameHomeScreen> {
  @override
  void initState() {
    super.initState();
    // Navegar para a tela de personagens após 5 segundos
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                Personagens()), // Altere para sua tela de personagens
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagem de fundo
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://github.com/user-attachments/assets/5d747e3a-f96c-4341-b6bb-a0ec3fefcf44',
                ),
                fit: BoxFit.cover, // Ajusta a imagem para cobrir toda a tela
              ),
            ),
          ),

          // Conteúdo sobreposto à imagem de fundo
          Center(
            child: SingleChildScrollView(
              // Adiciona um SingleChildScrollView
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
                    SizedBox(
                        height: 350), // Este espaço para image do backgraund
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
