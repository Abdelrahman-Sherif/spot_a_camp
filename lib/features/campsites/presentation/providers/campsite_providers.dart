import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spot_a_camp/features/campsites/barrel.dart';

final _campsiteDatasourceProvider = Provider<CampsiteDatasource>((ref) {
  return CampsiteDatasourceImpl();
});

final _campsiteRepositoryProvider = Provider<CampsiteRepository>((ref) {
  return CampsiteRepository(ref.read(_campsiteDatasourceProvider));
});

final campsiteListProvider = FutureProvider<List<Campsite>>((ref) async {
  final repository = ref.read(_campsiteRepositoryProvider);
  return repository.getCampsites();
});

final searchQueryProvider = StateProvider<String>((ref) => '');

final filterNotifierProvider =
    StateNotifierProvider<CampsiteFilterNotifier, CampsiteFilters>((ref) {
      return CampsiteFilterNotifier();
    });

final filteredCampsitesProvider = Provider<AsyncValue<List<Campsite>>>((ref) {
  final campsitesAsync = ref.watch(campsiteListProvider);
  final searchQuery = ref.watch(searchQueryProvider);
  final filters = ref.watch(filterNotifierProvider);

  return campsitesAsync.when(
    data: (campsites) {
      var filtered = campsites;

      // Apply search filter
      if (searchQuery.isNotEmpty) {
        filtered = filtered
            .where(
              (campsite) => campsite.label.toLowerCase().contains(
                searchQuery.toLowerCase(),
              ),
            )
            .toList();
      }

      // Apply filters
      if (filters.hasActiveFilters) {
        filtered = filtered
            .where((campsite) => filters.matchesCampsite(campsite))
            .toList();
      }

      // Sort by name
      filtered.sort((a, b) => a.label.compareTo(b.label));

      return AsyncValue.data(filtered);
    },
    loading: () => const AsyncValue.loading(),
    error: (error, stackTrace) => AsyncValue.error(error, stackTrace),
  );
});

final selectedCampsiteProvider = StateProvider<Campsite?>((ref) => null);

