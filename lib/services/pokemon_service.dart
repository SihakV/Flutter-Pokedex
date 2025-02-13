import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/pokemon.dart';

class PokemonService {
  Future<Map<String, dynamic>> getFirePokemon({int page = 1}) async {
    try {
      final response = await http.get(
        Uri.parse('https://pokeapi.co/api/v2/type/fire'),
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

  Future<Map<String, dynamic>> getWaterPokemon({int page = 1}) async {
    try {
      final response = await http.get(
        Uri.parse('https://pokeapi.co/api/v2/type/water'),
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

  Future<Map<String, dynamic>> getElectricPokemon({int page = 1}) async {
    try {
      final response = await http.get(
        Uri.parse('https://pokeapi.co/api/v2/type/electric'),
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

  Future<Map<String, dynamic>> getGrassPokemon({int page = 1}) async {
    try {
      final response = await http.get(
        Uri.parse('https://pokeapi.co/api/v2/type/grass'),
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
