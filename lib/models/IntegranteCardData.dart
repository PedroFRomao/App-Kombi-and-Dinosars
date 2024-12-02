class IntegranteCardData {
  final String imagem;
  final String nome;
  final List<String> cargos;

  IntegranteCardData({
    required this.imagem,
    required this.nome,
    required this.cargos,
  });
}

class IntegrantesData {
  static final List<IntegranteCardData> integrantes = [
    IntegranteCardData(
      imagem: 'assets/Pedro_Perfil.png',
      nome: 'Pedro Romão',
      cargos: ['Diretor Criativo', 'Dev Mobile'],
    ),
    IntegranteCardData(
      imagem: 'assets/Fernanda_Perfil.jpg',
      nome: 'Fernanda Viana',
      cargos: ['Diretora de Arte', 'Ilustradora'],
    ),
    IntegranteCardData(
      imagem: 'assets/Caua_Perfil.jpg',
      nome: 'Cauã Santos',
      cargos: ['Dev Full Stack', 'Líder Técnico'],
    ),
    IntegranteCardData(
      imagem: 'assets/Davi_Perfil.jpg',
      nome: 'Davi Nascimento',
      cargos: ['Artista 3D', 'Dev Full Stack'],
    ),
    IntegranteCardData(
      imagem: 'assets/Ruan_Perfil.jpg',
      nome: 'Ruan Fernandes',
      cargos: ['Coord. de Processos', 'Áudio Maker'],
    ),
    IntegranteCardData(
      imagem: 'assets/Gabriel_Perfil.jpg',
      nome: 'Gabriel Faria',
      cargos: ['Game Designer', 'Gerente de Operações'],
    ),
  ];
}
