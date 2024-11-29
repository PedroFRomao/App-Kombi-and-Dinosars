import 'package:flutter/material.dart';
//atualizacao foda 2
//
//proxima pagina
import 'game_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Faz ou Bebe',
      debugShowCheckedModeBanner: false, // Remove o debug banner
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black, // Fundo preto
      ),
      home: PlayerSetupScreen(),
    );
  }
}

class PlayerSetupScreen extends StatefulWidget {
  @override
  _PlayerSetupScreenState createState() => _PlayerSetupScreenState();
}

class _PlayerSetupScreenState extends State<PlayerSetupScreen> {
  List<String> players = [];
  List<TextEditingController> controllers = [];
  FocusNode focusNode = FocusNode(); // Para controlar o foco do campo
  ScrollController scrollController =
      ScrollController(); // Controlador de rolagem

  @override
  void initState() {
    super.initState();
    // Adiciona dois jogadores por padrão
    players.addAll(['Jogador 1', 'Jogador 2']);
    controllers.add(TextEditingController(text: 'Jogador 1'));
    controllers.add(TextEditingController(text: 'Jogador 2'));
  }

  void _addPlayer() {
    setState(() {
      players.add('Jogador ${players.length + 1}');
      controllers.add(TextEditingController(text: 'Jogador ${players.length}'));
      // Quando um novo jogador é adicionado, dá foco no último campo
      Future.delayed(Duration(milliseconds: 100), () {
        FocusScope.of(context).requestFocus(focusNode);
      });
    });
  }

  void _removePlayer(int index) {
    // Permite remover apenas jogadores a partir do terceiro
    if (index >= 2) {
      setState(() {
        players.removeAt(index);
        controllers.removeAt(index);
      });
    }
  }

  void _startGame() {
    // Se não houver nomes, substitui por Jogador 1, 2, etc.
    for (int i = 0; i < players.length; i++) {
      if (players[i].isEmpty) {
        players[i] = 'Jogador ${i + 1}';
      }
    }
    // Navega para a próxima tela com os nomes dos jogadores
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GameScreen(players: players),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        // Adiciona a barra de rolagem
        controller: scrollController, // Controlador da barra de rolagem
        thickness: 8.0, // Espessura da barra de rolagem
        radius: Radius.circular(10), // Arredondamento da barra
        scrollbarOrientation:
            ScrollbarOrientation.right, // Posiciona a barra à direita
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 32.0,
              vertical: 16.0), // Adiciona mais espaço nas laterais
          child: SingleChildScrollView(
            controller: scrollController, // Controla a rolagem
            child: Column(
              mainAxisAlignment: MainAxisAlignment
                  .center, // Centraliza os elementos verticalmente
              children: [
                // Título "Jogadores"
                Text(
                  'Jogadores',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white), // Título em negrito
                ),
                SizedBox(height: 20),
                ...List.generate(players.length, (index) {
                  return Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controllers[index],
                          focusNode: index == players.length - 1
                              ? focusNode
                              : null, // Atribui o focusNode apenas ao último campo
                          maxLength: 15,
                          style: TextStyle(
                            color: players[index] == 'Jogador ${index + 1}'
                                ? Colors.white70
                                : Colors
                                    .white, // Define a cor do texto do campo
                          ),
                          decoration: InputDecoration(
                            // Remove labelStyle e o contador de caracteres
                            hintText: players[
                                index], // Define o texto padrão como hintText
                            hintStyle: TextStyle(
                                color: Colors
                                    .white70), // Cor clara para o hintText
                            border: OutlineInputBorder(),
                            counterText: '', // Remove o contador de caracteres
                          ),
                          onChanged: (value) {
                            setState(() {
                              players[index] =
                                  value; // Atualiza o nome do jogador conforme digita
                            });
                          },
                          onTap: () {
                            // Quando o campo é clicado, se for o texto padrão, limpa
                            if (players[index] == 'Jogador ${index + 1}') {
                              setState(() {
                                players[index] = ''; // Limpa o texto padrão
                                controllers[index]
                                    .clear(); // Limpa o texto no campo
                              });
                            }
                          },
                        ),
                      ),
                      // Permite remover apenas jogadores a partir do terceiro
                      if (index >= 2)
                        IconButton(
                          icon: Icon(Icons.close,
                              color: Colors.white), // Ícone em branco
                          onPressed: () => _removePlayer(index),
                        ),
                    ],
                  );
                }),
                SizedBox(height: 20),
                Center(
                  // Centraliza o botão de adicionar jogador
                  child: GestureDetector(
                    onTap: _addPlayer,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .center, // Centraliza horizontalmente
                      children: [
                        Icon(Icons.add, color: Colors.white), // Ícone em branco
                        SizedBox(width: 8),
                        Text('Adicionar Jogador',
                            style: TextStyle(
                                color: Colors.white)), // Texto em branco
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _startGame,
                  child: Text('Jogar',
                      style: TextStyle(
                          color: Colors.black)), // Texto do botão em preto
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
