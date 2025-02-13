import 'package:flutter/material.dart';
import '../models/pokemon.dart';

class PokemonDetailsModal extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailsModal({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header with image and close button
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Center(
                    child: Image.network(
                      pokemon.imageUrl,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Pokemon name and number
              Text(
                '${pokemon.name[0].toUpperCase()}${pokemon.name.substring(1)} #${pokemon.id.toString().padLeft(3, '0')}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 24),

              // Types
              const Text(
                'Type',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children:
                    pokemon.types.map((type) {
                      return Chip(
                        label: Text(
                          type[0].toUpperCase() + type.substring(1),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        backgroundColor: _getTypeColor(type),
                      );
                    }).toList(),
              ),

              const SizedBox(height: 24),

              // Stats
              const Text(
                'Stats',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ...pokemon.stats.entries.map((stat) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        stat.key,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 4),
                      LinearProgressIndicator(
                        value: stat.value / 255, // Max stat value is 255
                        backgroundColor: Colors.grey[200],
                        valueColor: AlwaysStoppedAnimation<Color>(
                          _getStatColor(stat.value),
                        ),
                        minHeight: 8,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        stat.value.toString(),
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                    ],
                  ),
                );
              }).toList(),

              const SizedBox(height: 24),

              // Weaknesses
              const Text(
                'Weaknesses',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children:
                    pokemon.weaknesses.map((weakness) {
                      return Chip(
                        label: Text(
                          weakness[0].toUpperCase() + weakness.substring(1),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        backgroundColor: _getTypeColor(weakness),
                      );
                    }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'fire':
        return Colors.red;
      case 'water':
        return Colors.blue;
      case 'electric':
        return Colors.yellow.shade700;
      case 'grass':
        return Colors.green;
      case 'ground':
        return Colors.brown;
      case 'rock':
        return Colors.brown.shade700;
      case 'poison':
        return Colors.purple;
      case 'bug':
        return Colors.lightGreen;
      case 'flying':
        return Colors.lightBlue;
      case 'ice':
        return Colors.lightBlue.shade100;
      default:
        return Colors.grey;
    }
  }

  Color _getStatColor(int value) {
    if (value < 50) return Colors.red;
    if (value < 100) return Colors.orange;
    if (value < 150) return Colors.yellow.shade700;
    return Colors.green;
  }
}
