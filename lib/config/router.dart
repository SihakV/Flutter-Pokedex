import 'package:go_router/go_router.dart';
import '../screens/fire_pokemon_screen.dart';
import '../screens/main_screen.dart';
import '../screens/electric_pokemon_screen.dart';
import '../screens/water_pokemon_screen.dart';
import '../screens/grass_pokemon_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
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
      path: '/electric-pokemon',
      name: 'electric-pokemon',
      builder: (context, state) => const ElectricPokemonScreen(),
    ),
    GoRoute(
      path: '/grass-pokemon',
      name: 'grass-pokemon',
      builder: (context, state) => const GrassPokemonScreen(),
    ),
    GoRoute(
      path: '/',
      name: 'main-screen',
      builder: (context, state) => MainScreen(),
    ),
  ],
);
