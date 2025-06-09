import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:spot_a_camp/core/barrel.dart';
import 'package:spot_a_camp/features/campsites/barrel.dart';

class CampsitesMap extends ConsumerWidget {
  const CampsitesMap({
    required this.campsitesAsync,
    required this.onMapCreated,
    required this.markers,
    required this.clusterManagers,
    super.key,
  });

  final AsyncValue<List<Campsite>> campsitesAsync;
  final void Function(GoogleMapController) onMapCreated;
  final Set<Marker> markers;
  final Set<ClusterManager> clusterManagers;

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
        clusterManagers: clusterManagers,
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
