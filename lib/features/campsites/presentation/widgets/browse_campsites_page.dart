import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:spot_a_camp/core/barrel.dart';
import 'package:spot_a_camp/features/campsites/barrel.dart';

class BrowseCampsitesPage extends ConsumerStatefulWidget {
  const BrowseCampsitesPage({super.key});

  @override
  ConsumerState<BrowseCampsitesPage> createState() =>
      _BrowseCampsitesPageState();
}

class _BrowseCampsitesPageState extends ConsumerState<BrowseCampsitesPage> {
  GoogleMapController? _mapController;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _mapController?.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    ref.read(searchQueryProvider.notifier).state = _searchController.text;
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;

    // Focus on first campsite when map is ready
    final campsitesAsync = ref.read(campsiteListProvider);
    campsitesAsync.whenData((campsites) {
      if (campsites.isNotEmpty) {
        final firstCampsite = campsites.first;
        final lat = firstCampsite.geoLocation.lat;
        final lng = firstCampsite.geoLocation.long;

        _mapController?.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(lat, lng), zoom: 10.0),
          ),
        );
      }
    });
  }

  void _onCampsiteSelected(Campsite campsite) {
    ref.read(selectedCampsiteProvider.notifier).state = campsite;

    final lat = campsite.geoLocation.lat;
    final lng = campsite.geoLocation.long;

    // Animate map to selected campsite
    _mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 15.0),
      ),
    );
  }

  Set<Marker> _buildMarkers(List<Campsite> campsites) {
    final selectedCampsite = ref.watch(selectedCampsiteProvider);

    return campsites.map((campsite) {
      final isSelected = selectedCampsite?.id == campsite.id;

      final lat = campsite.geoLocation.lat;
      final lng = campsite.geoLocation.long;

      return Marker(
        markerId: MarkerId(campsite.id),
        position: LatLng(lat, lng),
        icon: isSelected
            ? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)
            : BitmapDescriptor.defaultMarker,
        onTap: () => _onCampsiteSelected(campsite),
        infoWindow: InfoWindow(
          title: campsite.label,
          snippet: '€${campsite.pricePerNight.toStringAsFixed(2)} per night',
        ),
      );
    }).toSet();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final campsitesAsync = ref.watch(campsiteListProvider);
    final filteredCampsitesAsync = ref.watch(filteredCampsitesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.browseCampsites),
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Map view
          _MapWidget(
            campsitesAsync: campsitesAsync,
            onMapCreated: _onMapCreated,
            markers: _buildMarkers(campsitesAsync.valueOrNull ?? []),
          ),

          // Bottom sheet with campsite list
          DraggableScrollableSheet(
            initialChildSize: 0.4,
            minChildSize: 0.2,
            maxChildSize: 0.8,
            builder: (context, scrollController) => PointerInterceptor(
              child: _ListWidget(
                scrollController: scrollController,
                searchController: _searchController,
                filteredCampsitesAsync: filteredCampsitesAsync,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MapWidget extends ConsumerWidget {
  const _MapWidget({
    required this.campsitesAsync,
    required this.onMapCreated,
    required this.markers,
  });

  final AsyncValue<List<Campsite>> campsitesAsync;
  final void Function(GoogleMapController) onMapCreated;
  final Set<Marker> markers;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return campsitesAsync.when(
      data: (campsites) => GoogleMap(
        onMapCreated: onMapCreated,
        initialCameraPosition: const CameraPosition(
          target: LatLng(50.0, 10.0), // Default position, will be updated
          zoom: 6.0,
        ),
        markers: markers,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: theme.colorScheme.error),
            const SizedBox(height: 16),
            Text(l10n.error, style: theme.textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text(
              error.toString(),
              style: theme.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => ref.refresh(campsiteListProvider),
              child: Text(l10n.retry),
            ),
          ],
        ),
      ),
    );
  }
}

class _ListWidget extends StatelessWidget {
  const _ListWidget({
    required this.scrollController,
    required this.searchController,
    required this.filteredCampsitesAsync,
  });

  final ScrollController scrollController;
  final TextEditingController searchController;
  final AsyncValue<List<Campsite>> filteredCampsitesAsync;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: CustomRadius.large),
        boxShadow: CustomShadow.medium,
      ),
      child: Column(
        children: [
          const SizedBox.square(dimension: Spacing.small3),
          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.small3),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: l10n.searchCampsites,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: searchController.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          searchController.clear();
                        },
                        icon: const Icon(Icons.clear),
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: CustomBorderRadius.medium,
                ),
                filled: true,
                fillColor: theme.colorScheme.surfaceContainerHighest,
              ),
            ),
          ),

          const SizedBox.square(dimension: Spacing.small3),

          // Campsite list
          Expanded(
            child: filteredCampsitesAsync.when(
              data: (campsites) {
                if (campsites.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 64,
                          color: theme.colorScheme.outline,
                        ),
                        const SizedBox.square(dimension: Spacing.small3),
                        Text(l10n.noResults, style: theme.textTheme.bodyLarge),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  controller: scrollController,
                  itemCount: campsites.length,
                  itemBuilder: (context, index) {
                    final campsite = campsites[index];
                    return CampsiteListItem(
                      campsite: campsite,
                      onTap: () => {},
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 64,
                      color: theme.colorScheme.error,
                    ),
                    const SizedBox.square(dimension: Spacing.small3),
                    Text(l10n.error, style: theme.textTheme.headlineSmall),
                    const SizedBox.square(dimension: Spacing.xs),
                    Text(
                      error.toString(),
                      style: theme.textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
