# 📱 Lorendex

Um aplicativo Flutter que consome a [PokéAPI](https://pokeapi.co/) para listar Pokémons, exibir suas imagens e permitir pesquisa em tempo real. Ao clicar em um Pokémon, é possível visualizar mais informações em uma nova tela.

---

## 🚀 Funcionalidades

- ✅ Listagem dos Pokémons (consumindo a PokéAPI)  
- ✅ Exibição da imagem de cada Pokémon  
- ✅ Barra de pesquisa para filtrar Pokémons pelo nome  
- ✅ Tela de detalhes ao clicar em um Pokémon  

---


## 🛠️ Tecnologias utilizadas

- [Flutter](https://flutter.dev/)  
- [Dio](https://pub.dev/packages/dio) para requisições HTTP  
- [PokéAPI](https://pokeapi.co/)  

---

## 📂 Estrutura do Projeto

lib/
├── main.dart # Arquivo principal do app
├── pokemon.dart # Modelo de dados do Pokémon
└── pokemon_detail.dart # Tela de detalhes do Pokémon

## ▶️ Como rodar o projeto


1. Clone este repositório:
   ```bash
   git clone https://github.com/LorenzoNied/lorendex.git

   Acesse a pasta do projeto:

cd lorendex


Instale as dependências:

flutter pub get


Execute o app:

flutter run
