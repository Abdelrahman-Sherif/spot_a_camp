import 'package:go_router/go_router.dart';
import 'package:spot_a_camp/features/welcome/barrel.dart';
import 'package:spot_a_camp/features/campsites/barrel.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const WelcomePage()),
    GoRoute(
      path: '/browse',
      builder: (context, state) => const BrowseCampsitesPage(),
    ),
  ],
);
