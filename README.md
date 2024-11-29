# Kombi and Dinosars - Mobile App

# Kombi and Dinosaurs - App Informativo

O **Kombi and Dinosaurs** é um jogo desenvolvido como parte do nosso TCC, e este aplicativo tem como objetivo fornecer uma visão detalhada sobre o jogo. Através do app, os jogadores poderão explorar a história do jogo, conhecer os personagens, entender as mecânicas e como cada fase do jogo funciona.

## 📂 Divisão do Projeto

O aplicativo é dividido em 4 principais seções, correspondendo às partes mais importantes do jogo. Cada seção possui elementos específicos que ajudam na navegação e interação do usuário.

### 1. **Home**
- **Objetivo**: Explicar o enredo do jogo, oferecendo uma visão geral da narrativa e uma area para nossos integrantes.
- **Elementos**:
  - **Imagem**: Nossa logo e as imagens dos integrantes.
  - **Texto**: Para sinopse do nosso jogo e para a presentar os cargos de cada integrantes.

# completar com a area de integrantes

### 2. **Personagens**
- **Objetivo**: Apresentar os personagens principais do jogo, suas características e habilidades.
- **Elementos**:
  - **Carrossel**: Um carrossel interativo para mostrar diferentes personagens, com suas imagens e descrições.
  - **Listagem**: Cada personagem é apresentado em uma lista, com detalhes como nome, habilidades e importância no jogo.

### 3. **Controles**
- **Objetivo**: Explicar as mecânicas e os controles utilizados durante o jogo.
- **Elementos**:
  - **Texto**: Explicações sobre os controles e como o jogador interage com o jogo.
  - **Imagens**: Ilustrações dos controles e botões usados durante o jogo.

### 4. **Fases**
- **Objetivo**: Detalhar as fases do jogo, explicando os desafios e objetivos de cada uma.
- **Elementos**:
  - **Carrossel**: Um carrossel interativo que permite ao usuário navegar pelas fases, com uma imagem e descrição de cada uma.
  - **Listagem**: Exibição das fases em formato de lista, com detalhes sobre os desafios e o que o jogador deve fazer em cada uma.

## 📂 Estrutura do Projeto

A estrutura do código está organizada da seguinte maneira:


```bash
KombiAndDinosaursApp/
├── assets/                   # Imagens, ícones e outros arquivos estáticos
├── lib/                      # Código fonte do app
│   ├── models/               # Modelos de dados do jogo
│   │   ├──
│   └── └── 
│   ├── screens/              # Telas do app 
│   │   ├── controles.dart
│   │   ├── fases.dart
│   │   ├── historia.dart
│   │   ├── main.dart            
│   │   └── personagens.dart  
│   ├── widgets/              # Widgets personalizados para o app
│   │   ├── 
│   └── └── 
├── pubspec.yaml              # Dependências e configurações do Flutter
└── README.md                 # Este arquivo README
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



link do backup <br>
https://drive.google.com/drive/folders/1R36-gfiiMH9NFkD9dur9wxWLHDVDhaZF?usp=drive_link
