class Pokemon {
  final int id;
  final String name;
  final String imageUrl;
  final List<String> types;
  final Map<String, int> stats;
  final List<String> weaknesses;

  Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.types,
    required this.stats,
    required this.weaknesses,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    // Extract types
    final types =
        (json['types'] as List)
            .map((type) => type['type']['name'] as String)
            .toList();

    // Extract stats
    final stats = Map<String, int>.fromEntries(
      (json['stats'] as List).map(
        (stat) => MapEntry(
          _formatStatName(stat['stat']['name']),
          stat['base_stat'] as int,
        ),
      ),
    );

    // Get weaknesses based on type
    final weaknesses = _getWeaknesses(types);

    return Pokemon(
      id: json['id'],
      name: json['name'],
      imageUrl: json['sprites']['other']['official-artwork']['front_default'],
      types: types,
      stats: stats,
      weaknesses: weaknesses,
    );
  }

  static String _formatStatName(String name) {
    switch (name) {
      case 'hp':
        return 'HP';
      case 'attack':
        return 'Attack';
      case 'defense':
        return 'Defense';
      case 'special-attack':
        return 'Special Attack';
      case 'special-defense':
        return 'Special Defense';
      case 'speed':
        return 'Speed';
      default:
        return name;
    }
  }

  static List<String> _getWeaknesses(List<String> types) {
    final Map<String, List<String>> typeWeaknesses = {
      'normal': ['fighting'],
      'fighting': ['flying', 'psychic', 'fairy'],
      'flying': ['rock', 'electric', 'ice'],
      'poison': ['ground', 'psychic'],
      'ground': ['water', 'grass', 'ice'],
      'rock': ['fighting', 'ground', 'steel', 'water', 'grass'],
      'bug': ['flying', 'rock', 'fire'],
      'ghost': ['ghost', 'dark'],
      'steel': ['fighting', 'ground', 'fire'],
      'fire': ['water', 'ground', 'rock'],
      'water': ['electric', 'grass'],
      'grass': ['flying', 'poison', 'bug', 'fire', 'ice'],
      'electric': ['ground'],
      'psychic': ['bug', 'ghost', 'dark'],
      'ice': ['fighting', 'rock', 'steel', 'fire'],
      'dragon': ['ice', 'dragon', 'fairy'],
      'dark': ['fighting', 'bug', 'fairy'],
      'fairy': ['poison', 'steel'],
      'stellar': ['dragon', 'fairy'], // Based on limited info about this type
    };

    final Set<String> weaknesses = {};
    for (final type in types) {
      weaknesses.addAll(typeWeaknesses[type] ?? []);
    }
    return weaknesses.toList();
  }
}
