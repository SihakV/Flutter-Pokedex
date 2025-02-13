// lib/screens/main_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PokemonType {
  final String name;
  final Color color;
  final IconData icon;

  PokemonType({required this.name, required this.color, required this.icon});
}

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final List<PokemonType> types = [
    PokemonType(
      name: 'Fire',
      color: Colors.red.shade400,
      icon: Icons.local_fire_department,
    ),
    PokemonType(
      name: 'Water',
      color: Colors.blue.shade400,
      icon: Icons.water_drop,
    ),
    PokemonType(
      name: 'Electric',
      color: Colors.yellow.shade700,
      icon: Icons.electric_bolt,
    ),
    PokemonType(name: 'Grass', color: Colors.green.shade400, icon: Icons.grass),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Title
              Text(
                'Welcome to the Pokédex',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade700,
                ),
                textAlign: TextAlign.center,
              ),

              // Professor Oak
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Image.asset(
                    'assets/images/oak.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              // Professor's Question
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Which type of Pokémon would you like to explore?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              // Type Grid
              Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: types.length,
                  itemBuilder: (context, index) {
                    final type = types[index];
                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: InkWell(
                        onTap: () {
                          if (type.name == 'Fire') {
                            GoRouter.of(context).goNamed('fire-pokemon');
                          }
                          if (type.name == 'Water') {
                            GoRouter.of(context).goNamed('water-pokemon');
                          }
                          if (type.name == 'Electric') {
                            GoRouter.of(context).goNamed('electric-pokemon');
                          }
                          if (type.name == 'Grass') {
                            GoRouter.of(context).goNamed('grass-pokemon');
                          }
                        },
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [type.color, type.color.withOpacity(0.7)],
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(type.icon, size: 40, color: Colors.white),
                              const SizedBox(height: 8),
                              Text(
                                type.name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
