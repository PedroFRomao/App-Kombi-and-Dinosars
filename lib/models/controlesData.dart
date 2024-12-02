class ControlesData {
  final String tituloControles;
  final String descricaoControles;
  final String imagemControles;

  ControlesData({
    required this.tituloControles,
    required this.descricaoControles,
    required this.imagemControles,
  });

  static final List<Map<String, String>> controles = [
    {
      'tituloControles': 'Movimentação do Personagem',
      'descricaoControles':
          'Pressione teclas (W, A, S e D) para fazer o personagem andar. Utilize o mouse para controlar a câmera. Dash (Corrida): Pressione as teclas de movimentação (W, A, S, D) junto com o SHIFT esquerdo para correr.',
      'imagemControles': 'assets/Controle1.png',
    },
    {
      'tituloControles': 'Coletar Itens',
      'descricaoControles':
          'Pressione a tecla “F” em cima de um item para coletá-lo.',
      'imagemControles': 'assets/Controle2.png',
    },
    {
      'tituloControles': 'Ataques',
      'descricaoControles':
          'Ataque simples: Clique com o botão esquerdo do mouse para um ataque simples.',
      'imagemControles': 'assets/Controle3.png',
    },
    {
      'tituloControles': 'Ataque Dash',
      'descricaoControles':
          'Ataque durante o Dash: Durante o dash, clique com o botão esquerdo do mouse para executar um ataque mais efetivo.',
      'imagemControles': 'assets/Controle3.png',
    },
    {
      'tituloControles': 'Ataque Especial',
      'descricaoControles':
          'Pressione a tecla “E” para executar um ataque especial que atinge todos os inimigos próximos. O jogador fica temporariamente invencível durante este golpe, porém ele tem um tempo de Cooldown (um tempo até poder utilizar a habilidade novamente). Além disso, ela precisa ser carregada com ataques básicos nos inimigos.',
      'imagemControles': 'assets/Controle4.png',
    },
  ];
}
