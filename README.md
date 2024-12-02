# Kombi and Dinosaurs - App Informativo

O **Kombi and Dinosaurs** é um jogo desenvolvido como parte do nosso TCC, e este aplicativo tem como objetivo fornecer uma visão detalhada sobre o jogo. Através do app, os jogadores poderão explorar a história do jogo, conhecer os personagens, entender as mecânicas e como cada fase do jogo funciona.

## 📂 Divisão do Projeto

O aplicativo é dividido em 4 principais telas, cada uma com funcionalidades específicas que ajudam na navegação e interação do usuário.

### 1. [**Home**](https://github.com/PedroFRomao/App-Kombi-and-Dinosars/wiki/1.-Home)

- Apresenta uma visão geral do jogo, com uma sinopse da história, uma imagem que leva o usuário para uma página contendo a HQ do jogo, e informações sobre os integrantes da equipe de desenvolvimento. Ao clicar na foto de cada integrante, o usuário é direcionado para uma página com a biografia, currículo e projetos anteriores.

### 2. [**Personagens**](https://github.com/PedroFRomao/App-Kombi-and-Dinosars/wiki/2.-Personagens)

- Apresenta os personagens principais do jogo e suas características.
  
### 3. [**Controles**](https://github.com/PedroFRomao/App-Kombi-and-Dinosars/wiki/3.-Controles)

- Explica as mecânicas e os controles utilizados durante o jogo.

### 4. [**Fases**](https://github.com/PedroFRomao/App-Kombi-and-Dinosars/wiki/4.-fases)

- Detalha as fases do jogo, explicando os desafios e objetivos de cada uma.

## 📂 Estrutura do Projeto

A estrutura do código está organizada da seguinte maneira:

``` bash
KombiAndDinosaursApp/
├── assets/                # Imagens e ícones
├── lib/                   # Código fonte do app
│   ├── models/            # Modelos de dados do jogo
│   │   ├── app_colors.dart
│   │   ├── app_fonts.dart
│   │   ├── controlesData.dart
│   │   ├── fasesData.dart
│   │   ├── homeData.dart
│   │   ├── integranteCardData.dart
│   │   ├── integrantePerfilData.dart
│   │   └── personagensData.dart
│   ├── screens/           # Telas do app
│   │   ├── controles.dart
│   │   ├── fases.dart
│   │   ├── home.dart
│   │   └── personagens.dart
│   ├── widgets/           # Widgets personalizados para o app
│   │   ├── customAppBar.dart
│   │   ├── customBottomNavBar.dart
│   │   ├── customFooter.dart
│   │   ├── HQ.dart
│   │   ├── integranteCard.dart
│   │   └── navigationDots.dart
│   └──main.dart
├── pubspec.yaml           # Dependências e configurações do Flutter
└── README.md              # Este arquivo README
```

## 🛠️ Funcionalidades no Código

Aqui estão algumas das funcionalidades implementadas no código para as seções mencionadas:

- **Navegação**: A navegação entre as páginas do app (História, Personagens, Controles, Fases) é feita utilizando o `Navigator` do Flutter, permitindo uma transição fluida entre as telas.
  
- **Carrossel de Personagens e Fases**: 
  - Utilização do widget `CarouselSlider` para implementar carrosséis interativos nas telas de **Personagens** e **Fases**, onde o usuário pode deslizar entre diferentes itens.
  
- **Listagem de Personagens e Fases**: 
  - Na tela de **Personagens**, usamos um `ListView` para exibir uma lista de personagens com suas descrições.
  - Na tela de **Fases**, outra lista é utilizada para mostrar as fases do jogo com informações sobre os desafios de cada uma.

- **Interface de Usuário (UI)**: 
  - Para organizar os elementos de forma clara e atraente, foram usados widgets como `Column`, `Row`, `Container` e `ListView` para exibir os conteúdos de maneira responsiva.
  
- **Estrutura de Dados**: 
  - O app utiliza classes para representar dados do jogo, como **Personagens** e **Fases**, permitindo que o conteúdo seja facilmente alimentado e modificado.
 
Para acessar os widgets e os models gerals:
[Widges Gerais](https://github.com/PedroFRomao/App-Kombi-and-Dinosars/wiki/5.-Widgets-gerais) 
[Models Gerais](https://github.com/PedroFRomao/App-Kombi-and-Dinosars/wiki/6.-Models-gerais)



 

