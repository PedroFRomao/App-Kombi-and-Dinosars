import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final List<String> doneChallenges;
  final List<String> notDoneChallenges;
  final Map<String, int> playerPoints;

  ResultScreen({
    required this.doneChallenges,
    required this.notDoneChallenges,
    required this.playerPoints,
  });

  @override
  Widget build(BuildContext context) {
    // Ordena os jogadores pela pontuação (menos pontos primeiro)
    List<MapEntry<String, int>> sortedPlayers = playerPoints.entries.toList()
      ..sort((a, b) => a.value.compareTo(b.value));

    return Scaffold(
      appBar: AppBar(
        title: Text('Resultados'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Desafios Feitos:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              ...doneChallenges
                  .map((challenge) => Text('- $challenge'))
                  .toList(),
              SizedBox(height: 20),
              Text(
                'Desafios Não Feitos:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              ...notDoneChallenges
                  .map((challenge) => Text('- $challenge'))
                  .toList(),
              SizedBox(height: 20),
              Text(
                'Pontuação dos Jogadores:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              ...sortedPlayers
                  .map((entry) => Text('${entry.key}: ${entry.value} pontos'))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
