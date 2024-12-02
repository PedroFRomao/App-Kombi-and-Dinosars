class HomeData {
  final String logoJogo;
  final String texto;
  final String hqTitulo;
  final String hqImagem;
  final String gubTitulo;

  HomeData({
    required this.logoJogo,
    required this.texto,
    required this.hqTitulo,
    required this.hqImagem,
    required this.gubTitulo,
  });

  // Instância com os dados fixos
  static final instance = HomeData(
    logoJogo: 'assets/Logo_jogo.png',
    texto: '''
Após uma guerra nuclear, a humanidade se esconde em bunkers e retorna à superfície após séculos, encontrando dinossauros geneticamente modificados devido à radiação. Uma gangue chamada CLTS domina uma cidade apocalíptica e é cruel com os habitantes fora dos muros. Seu Zé e seu filho Rogério têm sua casa destruída e decidem consertar uma velha Kombi para sobreviver. Eles se juntam a Enzo e Mirela para desafiar o líder da cidade e enfrentar os perigos dos dinossauros e da gangue. Juntos, enfrentam desafios para sobreviver no novo mundo apocalíptico.
''',
    hqTitulo: 'Conheça a nossa HQ',
    hqImagem: 'assets/hq_capa.png',
    gubTitulo: 'Conheça a equipe GUB',
  );
}
