import 'package:flutter/material.dart';
import 'dart:math';

class GameScreen extends StatefulWidget {
  final List<String> players; // Lista de jogadores

  GameScreen({required this.players});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late List<String> challenges;
  late List<String> doneChallenges;
  late List<String> notDoneChallenges;
  late Map<String, int> playerPoints;
  late Map<String, int> playerShots; // Adiciona um mapa para contar os shots
  int currentPlayerIndex = 0;
  String currentChallenge = '';
  bool showCard = false;
  bool showChallenge = false;
  bool buttonsEnabled = false;
  bool isDoButtonPressed = false;
  bool isDrinkButtonPressed = false;

  Future<bool> _showExitConfirmation() async {
    return await showDialog<bool>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              backgroundColor: Colors.white,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(Icons.close, color: Colors.black),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Tem certeza que deseja perder \ntodo o progresso?",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign
                        .center, // Este parâmetro deve ser movido para o Widget Text
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      minimumSize: Size(double.infinity,
                          50), // Faz o botão ocupar toda a largura
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .pop(true); // Fecha o diálogo retornando true
                    },
                    child: Text(
                      "Sair",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ) ??
        false; // Se o diálogo for fechado sem escolha, retorna false por padrão
  }

  @override
  void initState() {
    super.initState();
    challenges = [
      'Desafio 1',
      'Desafio 2',
      'Desafio 3',
      'Desafio 4',
      'Desafio 5',
    ];
    doneChallenges = [];
    notDoneChallenges = [];
    playerPoints = {for (var player in widget.players) player: 0};
    playerShots = {
      for (var player in widget.players) player: 0
    }; // Inicializa o mapa de shots
    _getNextChallenge();
  }

  void _getNextChallenge() {
    if (challenges.isEmpty) {
      Navigator.pop(context);
      return;
    }

    String challenge = challenges[Random().nextInt(challenges.length)];

    setState(() {
      currentChallenge = challenge;
      showCard = false;
      showChallenge = false;
      buttonsEnabled = false;
      isDoButtonPressed = false;
      isDrinkButtonPressed = false;
    });
  }

  void _onDo() {
    setState(() {
      doneChallenges.add(currentChallenge);
      challenges.remove(currentChallenge);
      _nextPlayer();
      _getNextChallenge();
      isDoButtonPressed = true;
    });
  }

  void _onDrink() {
    setState(() {
      notDoneChallenges.add(currentChallenge);
      playerPoints[widget.players[currentPlayerIndex]] =
          (playerPoints[widget.players[currentPlayerIndex]] ?? 0) + 1;
      playerShots[widget.players[currentPlayerIndex]] =
          (playerShots[widget.players[currentPlayerIndex]] ?? 0) +
              1; // Incrementa o shot
      challenges.remove(currentChallenge);
      _nextPlayer();
      _getNextChallenge();
      isDrinkButtonPressed = true;
    });
  }

  void _nextPlayer() {
    setState(() {
      currentPlayerIndex = (currentPlayerIndex + 1) % widget.players.length;
    });
  }

  void _revealCard() {
    setState(() {
      showCard = true;
      showChallenge = true;
      buttonsEnabled = true;
    });
  }

  void _showScoreboard() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(20),
          height: 300, // Define a altura da tela de pontuação
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pontuação',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, size: 30),
                    onPressed: () {
                      Navigator.pop(context); // Fecha a tela de pontuação
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.players.length,
                  itemBuilder: (context, index) {
                    String player = widget.players[index];
                    return ListTile(
                      title: Text(
                        player,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18, // Aumenta o tamanho do nome do jogador
                        ),
                      ),
                      subtitle: Text(
                        '${playerPoints[player]} desafios | ${playerShots[player]} shots',
                        style: TextStyle(
                            fontSize: 16), // Aumenta o tamanho do texto
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagem de fundo que cobre toda a tela
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover, // Faz a imagem cobrir toda a tela
              ),
            ),
          ),
          Column(
            children: [
              // AppBar com fundo transparente
              AppBar(
                backgroundColor:
                    Colors.transparent, // Define o fundo como transparente
                elevation: 0, // Remove a sombra da AppBar
                title: Text(
                  widget.players[currentPlayerIndex],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Color(0xffffffff), // Cor do texto
                  ),
                ),
                centerTitle: true,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Color(0xffffffff)),
                  onPressed: () async {
                    // Adiciona a confirmação ao pressionar voltar
                    bool? shouldExit = await _showExitConfirmation();
                    if (shouldExit == true) {
                      Navigator.pop(context);
                    }
                  },
                ),
                actions: [
                  IconButton(
                    icon: Icon(Icons.score, color: Color(0xffffffff)),
                    onPressed: _showScoreboard, // Abre a tela de pontuação
                  ),
                ],
              ),
              // O restante do seu conteúdo
              Expanded(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Spacer(),
                        GestureDetector(
                          onTap: _revealCard,
                          child: Center(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                if (showCard)
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.7,
                                    child: Image.asset(
                                      'assets/carta_vazia.png',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                if (showChallenge)
                                  Positioned(
                                    top: 50,
                                    left: 30,
                                    right: 30,
                                    child: Text(
                                      currentChallenge,
                                      style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                if (!showCard)
                                  Text(
                                    'Clique para revelar o desafio',
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // Botão "Faço"
                            ElevatedButton(
                              onPressed: buttonsEnabled ? _onDo : null,
                              child: Text(
                                'Faço',
                                style: TextStyle(
                                  color: buttonsEnabled
                                      ? Colors.white
                                      : Colors.white.withOpacity(
                                          0.5), // Cor ajustada para bloqueio
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                side: BorderSide(
                                  color: buttonsEnabled
                                      ? Colors.white
                                      : Colors.white.withOpacity(
                                          0.5), // Contorno ajustado para bloqueio
                                  width: 2,
                                ),
                                padding: EdgeInsets.all(30),
                                backgroundColor:
                                    Colors.transparent, // Fundo transparente
                              ),
                            ),
                            // Botão "Bebo"
                            ElevatedButton(
                              onPressed: buttonsEnabled ? _onDrink : null,
                              child: Text(
                                'Bebo',
                                style: TextStyle(
                                  color: buttonsEnabled
                                      ? Colors.white
                                      : Colors.white.withOpacity(
                                          0.5), // Cor ajustada para bloqueio
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                side: BorderSide(
                                  color: buttonsEnabled
                                      ? Colors.white
                                      : Colors.white.withOpacity(
                                          0.5), // Contorno ajustado para bloqueio
                                  width: 2,
                                ),
                                padding: EdgeInsets.all(30),
                                backgroundColor:
                                    Colors.transparent, // Fundo transparente
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
