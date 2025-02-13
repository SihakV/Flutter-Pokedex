import 'package:go_router/go_router.dart';
import '../screens/main_screen.dart';
import '../screens/fire_pokemon_screen.dart';
import '../screens/water_pokemon_screen.dart';
import '../screens/electric_pokemon_screen.dart';
import '../screens/grass_pokemon_screen.dart';
import '../screens/normal_pokemon_screen.dart';
import '../screens/fighting_pokemon_screen.dart';
import '../screens/flying_pokemon_screen.dart';
import '../screens/poison_pokemon_screen.dart';
import '../screens/ground_pokemon_screen.dart';
import '../screens/rock_pokemon_screen.dart';
import '../screens/bug_pokemon_screen.dart';
import '../screens/ghost_pokemon_screen.dart';
import '../screens/steel_pokemon_screen.dart';
import '../screens/psychic_pokemon_screen.dart';
import '../screens/ice_pokemon_screen.dart';
import '../screens/dragon_pokemon_screen.dart';
import '../screens/dark_pokemon_screen.dart';
import '../screens/fairy_pokemon_screen.dart';
import '../screens/stellar_pokemon_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'main-screen',
      builder: (context, state) => MainScreen(),
    ),
    GoRoute(
      path: '/normal-pokemon',
      name: 'normal-pokemon',
      builder: (context, state) => const NormalPokemonScreen(),
    ),
    GoRoute(
      path: '/fighting-pokemon',
      name: 'fighting-pokemon',
      builder: (context, state) => const FightingPokemonScreen(),
    ),
    GoRoute(
      path: '/flying-pokemon',
      name: 'flying-pokemon',
      builder: (context, state) => const FlyingPokemonScreen(),
    ),
    GoRoute(
      path: '/poison-pokemon',
      name: 'poison-pokemon',
      builder: (context, state) => const PoisonPokemonScreen(),
    ),
    GoRoute(
      path: '/ground-pokemon',
      name: 'ground-pokemon',
      builder: (context, state) => const GroundPokemonScreen(),
    ),
    GoRoute(
      path: '/rock-pokemon',
      name: 'rock-pokemon',
      builder: (context, state) => const RockPokemonScreen(),
    ),
    GoRoute(
      path: '/bug-pokemon',
      name: 'bug-pokemon',
      builder: (context, state) => const BugPokemonScreen(),
    ),
    GoRoute(
      path: '/ghost-pokemon',
      name: 'ghost-pokemon',
      builder: (context, state) => const GhostPokemonScreen(),
    ),
    GoRoute(
      path: '/steel-pokemon',
      name: 'steel-pokemon',
      builder: (context, state) => const SteelPokemonScreen(),
    ),
    GoRoute(
      path: '/fire-pokemon',
      name: 'fire-pokemon',
      builder: (context, state) => const FirePokemonScreen(),
    ),
    GoRoute(
      path: '/water-pokemon',
      name: 'water-pokemon',
      builder: (context, state) => const WaterPokemonScreen(),
    ),
    GoRoute(
      path: '/grass-pokemon',
      name: 'grass-pokemon',
      builder: (context, state) => const GrassPokemonScreen(),
    ),
    GoRoute(
      path: '/electric-pokemon',
      name: 'electric-pokemon',
      builder: (context, state) => const ElectricPokemonScreen(),
    ),
    GoRoute(
      path: '/psychic-pokemon',
      name: 'psychic-pokemon',
      builder: (context, state) => const PsychicPokemonScreen(),
    ),
    GoRoute(
      path: '/ice-pokemon',
      name: 'ice-pokemon',
      builder: (context, state) => const IcePokemonScreen(),
    ),
    GoRoute(
      path: '/dragon-pokemon',
      name: 'dragon-pokemon',
      builder: (context, state) => const DragonPokemonScreen(),
    ),
    GoRoute(
      path: '/dark-pokemon',
      name: 'dark-pokemon',
      builder: (context, state) => const DarkPokemonScreen(),
    ),
    GoRoute(
      path: '/fairy-pokemon',
      name: 'fairy-pokemon',
      builder: (context, state) => const FairyPokemonScreen(),
    ),
    GoRoute(
      path: '/stellar-pokemon',
      name: 'stellar-pokemon',
      builder: (context, state) => const StellarPokemonScreen(),
    ),
  ],
);
