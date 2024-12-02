class PersonagensData {
  final String titulo;
  final String imagem;
  final String sobrePersonagem;
  final String ferramenta;
  final String imagemFerramenta;

  PersonagensData({
    required this.titulo,
    required this.imagem,
    required this.sobrePersonagem,
    required this.ferramenta,
    required this.imagemFerramenta,
  });

  // Lista de fases (personagens)
  static final List<PersonagensData> fases = [
    PersonagensData(
      titulo: 'Jeronimo',
      imagem: 'assets/Personagem1.png',
      sobrePersonagem:
          'Nosso Agroboy tem um forte senso de responsabilidade e faz o possível para proteger aqueles que ama. Ele é prático e prefere ação direta, mas sabe quando é necessário ser cuidadoso.',
      ferramenta: 'Enxada',
      imagemFerramenta: 'assets/Ferramenta1.png',
    ),
    PersonagensData(
      titulo: 'Seu Zé',
      imagem: 'assets/Personagem2.png',
      sobrePersonagem:
          'Emburrado, teimoso e não ligam para que os outros pensam. Seu Zé tem muita experiência de vida, por isso é muito resistente a tudo.',
      ferramenta: 'Garrafa de vidro',
      imagemFerramenta: 'assets/Ferramenta2.png',
    ),
    PersonagensData(
      titulo: 'Mirela',
      imagem: 'assets/Personagem3.png',
      sobrePersonagem:
          'Jovem meiga e delicada quando está ao lado de seu namorado, quando longe dele não recomendamos ficar perto dela.',
      ferramenta: 'Varinha',
      imagemFerramenta: 'assets/Ferramenta3.png',
    ),
    PersonagensData(
      titulo: 'Enzo',
      imagem: 'assets/Personagem4.png',
      sobrePersonagem:
          'Forte e veloz. Mas com pouca energia e também conta com sua super habilidade que se ativa quando está sozinho, que é ser medroso.',
      ferramenta: 'Cavaquinho',
      imagemFerramenta: 'assets/Ferramenta4.png',
    ),
  ];
}
