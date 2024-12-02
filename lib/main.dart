import 'package:flutter/material.dart';

// Importações das páginas
import '/screens/home.dart';
import '/screens/fases.dart';
import '/screens/personagens.dart';
import '/screens/controles.dart';

void main() {
  runApp(GameApp());
}

class GameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/', // A rota inicial
      routes: {
        '/': (context) => GameHomeScreen(), // Tela de carregamento
        '/home': (context) => Home(), // Tela Home
        '/fases': (context) => Fases(),
        '/personagens': (context) => Personagens(),
        '/controles': (context) => Controles(),
      },
      debugShowCheckedModeBanner: false, // Remove o banner de debug
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
    // Atraso de 2 segundos antes de navegar para a tela Home
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()), // Navega para Home
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
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Logo e tela de introdução
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.all(20.0), // Adiciona espaço nas bordas
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(
                      image: NetworkImage(
                          'https://github.com/user-attachments/assets/6eccdd27-ff70-4135-9b12-2ce63e709a94'),
                    ),
                    SizedBox(height: 150), // Espaço abaixo da imagem
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
