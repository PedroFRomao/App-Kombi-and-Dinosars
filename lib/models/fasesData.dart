class FasesData {
  final String titulo;
  final String imagemFase;
  final String sobreFase;

  FasesData({
    required this.titulo,
    required this.imagemFase,
    required this.sobreFase,
  });

  static final List<FasesData> fases = [
    FasesData(
      titulo: 'Posto de gasolina',
      imagemFase: 'assets/Fase_1.jpg',
      sobreFase:
          'Fugindo dos dinossauros que destruíram seu abrigo, Seu Zé e Rogério encontram uma Kombi em um posto mecânico abandonado e decidem consertá-la. Enquanto Seu Zé conserta a Kombi, Rogério protege ambos dos dinossauros e de membros da gangue que surgiram enquanto coleta itens que ajudam no conserto.',
    ),
    FasesData(
      titulo: 'O Mercado Abandonado',
      imagemFase: 'assets/Fase_2.jpg',
      sobreFase:
          'Ao saírem do posto com a Kombi, Seu Zé e Rogério chegam a uma cidade completamente destruída e encontram um mercado, eles decidem descer do veículo e ir em busca de suprimentos. Ao entrarem no mercado, veem diversos membros da gangue atacando uma menina e decidem salvá-la.',
    ),
    FasesData(
      titulo: 'Perseguição na cidade',
      imagemFase: 'assets/Fase_3.jpg',
      sobreFase:
          'Seu Zé e Rogério junto com Mirela vão em busca de salvar o namorado dela (Enzo) que foi pego pela gangue. Enzo é sequestrado em um veículo da gangue, os personagens na Kombi devem perseguir e destruir os veículos colidindo com eles, se ele demorar pra resgatar o Enzo, a gangue consegue escapar.',
    ),
    FasesData(
      titulo: 'Invasão à Base',
      imagemFase: 'assets/Fase_4.jpg',
      sobreFase:
          'Grupo totalmente unido vai em busca de invadir a cidade onde vive o líder da gangue. Para entrar eles precisam derrotar membros da gangue e descobrir a localização do chefe dos “CLTS”.',
    ),
    FasesData(
      titulo: 'A Batalha Final',
      imagemFase: 'assets/Fase_5.jpg',
      sobreFase:
          'O grupo encontra o chefe final e lá começa a batalha pela liberdade.',
    ),
  ];
}
