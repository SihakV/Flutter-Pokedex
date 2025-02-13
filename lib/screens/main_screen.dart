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
      name: 'Normal',
      color: Colors.grey.shade400,
      icon: Icons.circle_outlined,
    ),
    PokemonType(
      name: 'Fighting',
      color: Colors.brown.shade700,
      icon: Icons.sports_mma,
    ),
    PokemonType(
      name: 'Flying',
      color: Colors.lightBlue.shade300,
      icon: Icons.flight,
    ),
    PokemonType(
      name: 'Poison',
      color: Colors.purple.shade400,
      icon: Icons.science,
    ),
    PokemonType(
      name: 'Ground',
      color: Colors.brown.shade400,
      icon: Icons.landscape,
    ),
    PokemonType(
      name: 'Rock',
      color: Colors.brown.shade500,
      icon: Icons.terrain,
    ),
    PokemonType(
      name: 'Bug',
      color: Colors.lightGreen.shade500,
      icon: Icons.bug_report,
    ),
    PokemonType(
      name: 'Ghost',
      color: Colors.deepPurple.shade400,
      icon: Icons.visibility_off,
    ),
    PokemonType(
      name: 'Steel',
      color: Colors.blueGrey.shade400,
      icon: Icons.shield,
    ),
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
    PokemonType(name: 'Grass', color: Colors.green.shade400, icon: Icons.grass),
    PokemonType(
      name: 'Electric',
      color: Colors.yellow.shade700,
      icon: Icons.electric_bolt,
    ),
    PokemonType(
      name: 'Psychic',
      color: Colors.pink.shade400,
      icon: Icons.psychology,
    ),
    PokemonType(
      name: 'Ice',
      color: Colors.lightBlue.shade200,
      icon: Icons.ac_unit,
    ),
    PokemonType(
      name: 'Dragon',
      color: Colors.indigo.shade400,
      icon: Icons.auto_awesome,
    ),
    PokemonType(
      name: 'Dark',
      color: Colors.grey.shade800,
      icon: Icons.dark_mode,
    ),
    PokemonType(
      name: 'Fairy',
      color: Colors.pink.shade200,
      icon: Icons.auto_fix_high,
    ),
    PokemonType(
      name: 'Stellar',
      color: Colors.amber.shade400,
      icon: Icons.stars,
    ),
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
              Text(
                'Welcome to the Pokédex',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade700,
                ),
                textAlign: TextAlign.center,
              ),
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
                          final routeName =
                              '${type.name.toLowerCase()}-pokemon';
                          GoRouter.of(context).goNamed(routeName);
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
