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
    GoRoute(
      path: '/campsite/:id',
      builder: (context, state) {
        final campsite = state.extra as Campsite?;
        if (campsite != null) {
          return CampsiteDetailPage(campsite: campsite);
        }

        // Fallback
        return const BrowseCampsitesPage();
      },
    ),
  ],
);
