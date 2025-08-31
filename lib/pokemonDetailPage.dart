import 'package:flutter/material.dart';
import 'pokemon.dart';

class PokemonDetailPage extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailPage({super.key, required this.pokemon});
// apenas um teste para criar outras paginas 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name ?? "Detalhes"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(pokemon.imagem ?? ""),
            const SizedBox(height: 50),
            Text(
              pokemon.name ?? "",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text("URL: ${pokemon.url}"),

          ],
        ),
      ),
    );
  }
}