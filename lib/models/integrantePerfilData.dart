class IntegrantePerfil {
  final String banner;
  final String fotoPerfil;
  final String nome;
  final String descricao;
  final List<Projeto> projetos;

  IntegrantePerfil({
    required this.banner,
    required this.fotoPerfil,
    required this.nome,
    required this.descricao,
    required this.projetos,
  });
}

class Projeto {
  final String imagem;
  final String titulo;
  final String descricao;

  Projeto({
    required this.imagem,
    required this.titulo,
    required this.descricao,
  });
}

final List<IntegrantePerfil> integrantesData = [
  IntegrantePerfil(
    banner: 'assets/Pedro_Banner.png',
    fotoPerfil: 'assets/Pedro_Perfil.png',
    nome: 'Pedro Romão',
    descricao:
        'Acredito que o aprendizado nunca para. Em cada projeto que desenvolvo, vejo desafios como oportunidades e transformo sonhos em conquistas.',
    projetos: [
      Projeto(
        imagem: 'assets/Pedro_Projeto1.png',
        titulo: 'App KaD',
        descricao:
            'Descubra tudo sobre o mundo de Kombi and Dinosaurs neste app.',
      ),
      Projeto(
        imagem: 'assets/Pedro_Projeto2.png',
        titulo: 'App Faz ou Bebe',
        descricao:
            'Leve a diversão do famoso jogo de bebidas para o seu celular com este app.',
      ),
      Projeto(
        imagem: 'assets/Pedro_Projeto3.png',
        titulo: 'App Jason Chan',
        descricao:
            'Explore a trajetória do renomado artista Jason Chan famoso no mundo dos jogos.',
      ),
      Projeto(
        imagem: 'assets/Pedro_Projeto4.png',
        titulo: 'Projeto de poker',
        descricao:
            'Um projeto audacioso com o objetivo de criar um grande aplicativo de pôquer online.',
      ),
    ],
  ),
  IntegrantePerfil(
    banner: 'assets/Fernanda_Banner.jpg',
    fotoPerfil: 'assets/Fernanda_Perfil.jpg',
    nome: 'Fernanda Viana',
    descricao: 'Uma breve descrição',
    projetos: [
      Projeto(
        imagem: 'https://linkImagemProjeto1.com',
        titulo: 'Projeto 1',
        descricao: 'Breve descrição do projeto 1.',
      ),
      Projeto(
        imagem: 'https://linkImagemProjeto2.com',
        titulo: 'Projeto 2',
        descricao: 'Breve descrição do projeto 2.',
      ),
      Projeto(
        imagem: 'https://linkImagemProjeto3.com',
        titulo: 'Projeto 3',
        descricao: 'Breve descrição do projeto 3.',
      ),
      Projeto(
        imagem: 'https://linkImagemProjeto4.com',
        titulo: 'Projeto 4',
        descricao: 'Breve descrição do projeto 4.',
      ),
    ],
  ),
  IntegrantePerfil(
    banner: 'assets/Caua_Banner.jpg',
    fotoPerfil: 'assets/Caua_Perfil.jpg',
    nome: 'Cauã Santos',
    descricao: 'Uma breve descrição',
    projetos: [
      Projeto(
        imagem: 'https://linkImagemProjeto1.com',
        titulo: 'Projeto 1',
        descricao: 'Breve descrição do projeto 1.',
      ),
      Projeto(
        imagem: 'https://linkImagemProjeto2.com',
        titulo: 'Projeto 2',
        descricao: 'Breve descrição do projeto 2.',
      ),
      Projeto(
        imagem: 'https://linkImagemProjeto3.com',
        titulo: 'Projeto 3',
        descricao: 'Breve descrição do projeto 3.',
      ),
      Projeto(
        imagem: 'https://linkImagemProjeto4.com',
        titulo: 'Projeto 4',
        descricao: 'Breve descrição do projeto 4.',
      ),
    ],
  ),
  IntegrantePerfil(
    banner: 'assets/Davi_Banner.jpg',
    fotoPerfil: 'assets/Davi_Perfil.jpg',
    nome: 'Davi Nascimento',
    descricao: 'Uma breve descrição',
    projetos: [
      Projeto(
        imagem: 'https://linkImagemProjeto1.com',
        titulo: 'Projeto 1',
        descricao: 'Breve descrição do projeto 1.',
      ),
      Projeto(
        imagem: 'https://linkImagemProjeto2.com',
        titulo: 'Projeto 2',
        descricao: 'Breve descrição do projeto 2.',
      ),
      Projeto(
        imagem: 'https://linkImagemProjeto3.com',
        titulo: 'Projeto 3',
        descricao: 'Breve descrição do projeto 3.',
      ),
      Projeto(
        imagem: 'https://linkImagemProjeto4.com',
        titulo: 'Projeto 4',
        descricao: 'Breve descrição do projeto 4.',
      ),
    ],
  ),
  IntegrantePerfil(
    banner: 'assets/Ruan_Banner.jpg',
    fotoPerfil: 'assets/Ruan_Perfil.jpg',
    nome: 'Ruan Fernandes',
    descricao: 'Uma breve descrição',
    projetos: [
      Projeto(
        imagem: 'https://linkImagemProjeto1.com',
        titulo: 'Projeto 1',
        descricao: 'Breve descrição do projeto 1.',
      ),
      Projeto(
        imagem: 'https://linkImagemProjeto2.com',
        titulo: 'Projeto 2',
        descricao: 'Breve descrição do projeto 2.',
      ),
      Projeto(
        imagem: 'https://linkImagemProjeto3.com',
        titulo: 'Projeto 3',
        descricao: 'Breve descrição do projeto 3.',
      ),
      Projeto(
        imagem: 'https://linkImagemProjeto4.com',
        titulo: 'Projeto 4',
        descricao: 'Breve descrição do projeto 4.',
      ),
    ],
  ),
  IntegrantePerfil(
    banner: 'assets/Gabriel_Banner.jpg',
    fotoPerfil: 'assets/Gabriel_Perfil.jpg',
    nome: 'Gabriel Faria',
    descricao: 'Uma breve descrição',
    projetos: [
      Projeto(
        imagem: 'https://linkImagemProjeto1.com',
        titulo: 'Projeto 1',
        descricao: 'Breve descrição do projeto 1.',
      ),
      Projeto(
        imagem: 'https://linkImagemProjeto2.com',
        titulo: 'Projeto 2',
        descricao: 'Breve descrição do projeto 2.',
      ),
      Projeto(
        imagem: 'https://linkImagemProjeto3.com',
        titulo: 'Projeto 3',
        descricao: 'Breve descrição do projeto 3.',
      ),
      Projeto(
        imagem: 'https://linkImagemProjeto4.com',
        titulo: 'Projeto 4',
        descricao: 'Breve descrição do projeto 4.',
      ),
    ],
  ),
];
