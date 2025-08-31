import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:lorendex/pokemon.dart';
import 'package:lorendex/pokemonDetailPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lorendex',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Lorendex'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Pokemon> pokemons = [];
  String pokemonName = "";

  Future<void> _buscarPokemon() async {
    final dio = Dio();
    final response = await dio.get('https://pokeapi.co/api/v2/pokemon/?offset=0&limit=20');

    pokemons = response.data["results"].map<Pokemon>((element){
      return Pokemon.fromJson(element);
    }).toList();

    for(var pokemon in pokemons){
      pokemon.imagem = await _buscarImagem(pokemon.name!);
    }

     setState(() {
      
    });
  }

  Future<String> _buscarImagem(String name) async {
    try{
      final dio = Dio();
      final response = await dio.get("https://pokeapi.co/api/v2/pokemon/$name/");

      return response.data["sprites"]["front_default"];
    } catch (e){
      return "https://ih1.redbubble.net/image.4905811472.8675/bg,f8f8f8-flat,750x,075,f-pad,750x1000,f8f8f8.jpg";
    }
  }
  
  @override
  void initState() {
    super.initState();
    _buscarPokemon();
  }


  @override
  Widget build(BuildContext context) {
    final filteredPokemons = pokemons
        .where((p) => p.name!.toLowerCase().contains(pokemonName.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          // Barra de pesquisa
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Pesquisar Pokémon...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  pokemonName = value;
                });
              },
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: filteredPokemons.length,
              itemBuilder: (context, index) {
                final pokemon = filteredPokemons[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PokemonDetailPage(pokemon: pokemon),
                      ),
                    );
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Pokemon: ${pokemon.name}"),
                                Text("Descrição: ${pokemon.url}"),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Image.network(pokemon.imagem ?? ""),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}