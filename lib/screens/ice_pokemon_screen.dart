import 'package:flutter/material.dart';
import '../models/pokemon.dart';
import '../services/pokemon_service.dart';
import 'package:go_router/go_router.dart';
import 'pokemon_details_modal.dart';

class IcePokemonScreen extends StatefulWidget {
  const IcePokemonScreen({super.key});

  @override
  State<IcePokemonScreen> createState() => _IcePokemonScreenState();
}

class _IcePokemonScreenState extends State<IcePokemonScreen> {
  final PokemonService _pokemonService = PokemonService();
  List<Pokemon> _pokemons = [];
  bool _isLoading = true;
  int _currentPage = 1;
  int _totalPages = 1;
  bool _isLoadingMore = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadPokemon();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _loadMorePokemon();
    }
  }

  Future<void> _loadPokemon() async {
    try {
      final result = await _pokemonService.getIcePokemon(page: _currentPage);
      setState(() {
        _pokemons = result['pokemons'];
        _totalPages = result['totalPages'];
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error loading Pokémon: $e')));
      }
    }
  }

  Future<void> _loadMorePokemon() async {
    if (_isLoadingMore || _currentPage >= _totalPages) return;

    setState(() {
      _isLoadingMore = true;
    });

    try {
      final result = await _pokemonService.getIcePokemon(
        page: _currentPage + 1,
      );
      setState(() {
        _pokemons.addAll(result['pokemons']);
        _currentPage = result['currentPage'];
        _isLoadingMore = false;
      });
    } catch (e) {
      setState(() {
        _isLoadingMore = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading more Pokémon: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ice Pokémon'),
        backgroundColor: Colors.red,
        titleTextStyle: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => GoRouter.of(context).goNamed('main-screen'),
        ),
      ),
      body:
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.all(16),
                      itemCount: _pokemons.length + (_isLoadingMore ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index == _pokemons.length) {
                          return const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }

                        final pokemon = _pokemons[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 16),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(8),
                            leading: Image.network(
                              pokemon.imageUrl,
                              width: 80,
                              height: 80,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: 80,
                                  height: 80,
                                  color: Colors.grey[300],
                                  child: const Icon(Icons.broken_image),
                                );
                              },
                            ),
                            title: Text(
                              pokemon.name[0].toUpperCase() +
                                  pokemon.name.substring(1),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              '#${pokemon.id.toString().padLeft(3, '0')}',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder:
                                    (context) =>
                                        PokemonDetailsModal(pokemon: pokemon),
                              );
                            },
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
