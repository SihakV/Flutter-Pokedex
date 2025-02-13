import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/pokemon.dart';

class PokemonService {
  Future<Map<String, dynamic>> getFirePokemon({int page = 1}) async {
    return _getPokemonByType('fire', page);
  }

  Future<Map<String, dynamic>> getWaterPokemon({int page = 1}) async {
    return _getPokemonByType('water', page);
  }

  Future<Map<String, dynamic>> getElectricPokemon({int page = 1}) async {
    return _getPokemonByType('electric', page);
  }

  Future<Map<String, dynamic>> getGrassPokemon({int page = 1}) async {
    return _getPokemonByType('grass', page);
  }

  Future<Map<String, dynamic>> getNormalPokemon({int page = 1}) async {
    return _getPokemonByType('normal', page);
  }

  Future<Map<String, dynamic>> getFightingPokemon({int page = 1}) async {
    return _getPokemonByType('fighting', page);
  }

  Future<Map<String, dynamic>> getFlyingPokemon({int page = 1}) async {
    return _getPokemonByType('flying', page);
  }

  Future<Map<String, dynamic>> getPoisonPokemon({int page = 1}) async {
    return _getPokemonByType('poison', page);
  }

  Future<Map<String, dynamic>> getGroundPokemon({int page = 1}) async {
    return _getPokemonByType('ground', page);
  }

  Future<Map<String, dynamic>> getRockPokemon({int page = 1}) async {
    return _getPokemonByType('rock', page);
  }

  Future<Map<String, dynamic>> getBugPokemon({int page = 1}) async {
    return _getPokemonByType('bug', page);
  }

  Future<Map<String, dynamic>> getGhostPokemon({int page = 1}) async {
    return _getPokemonByType('ghost', page);
  }

  Future<Map<String, dynamic>> getSteelPokemon({int page = 1}) async {
    return _getPokemonByType('steel', page);
  }

  Future<Map<String, dynamic>> getPsychicPokemon({int page = 1}) async {
    return _getPokemonByType('psychic', page);
  }

  Future<Map<String, dynamic>> getIcePokemon({int page = 1}) async {
    return _getPokemonByType('ice', page);
  }

  Future<Map<String, dynamic>> getDragonPokemon({int page = 1}) async {
    return _getPokemonByType('dragon', page);
  }

  Future<Map<String, dynamic>> getDarkPokemon({int page = 1}) async {
    return _getPokemonByType('dark', page);
  }

  Future<Map<String, dynamic>> getFairyPokemon({int page = 1}) async {
    return _getPokemonByType('fairy', page);
  }

  Future<Map<String, dynamic>> getStellarPokemon({int page = 1}) async {
    return _getPokemonByType('stellar', page);
  }

  Future<Map<String, dynamic>> _getPokemonByType(String type, int page) async {
    try {
      final response = await http.get(
        Uri.parse('https://pokeapi.co/api/v2/type/$type'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final pokemonList = data['pokemon'] as List;
        final totalItems = pokemonList.length;
        final itemsPerPage = 10;
        final totalPages = (totalItems / itemsPerPage).ceil();

        // Calculate start and end indices for the current page
        final startIndex = (page - 1) * itemsPerPage;
        final endIndex =
            startIndex + itemsPerPage > pokemonList.length
                ? pokemonList.length
                : startIndex + itemsPerPage;

        final List<Pokemon> pokemons = [];

        // Fetch only the Pokémon for the current page
        for (var i = startIndex; i < endIndex; i++) {
          final pokemonUrl = pokemonList[i]['pokemon']['url'];
          final pokemonResponse = await http.get(Uri.parse(pokemonUrl));

          if (pokemonResponse.statusCode == 200) {
            pokemons.add(Pokemon.fromJson(json.decode(pokemonResponse.body)));
          }
        }

        return {
          'pokemons': pokemons,
          'currentPage': page,
          'totalPages': totalPages,
          'totalItems': totalItems,
        };
      } else {
        throw Exception('Failed to load pokemon');
      }
    } catch (e) {
      throw Exception('Error fetching pokemon: $e');
    }
  }
}
