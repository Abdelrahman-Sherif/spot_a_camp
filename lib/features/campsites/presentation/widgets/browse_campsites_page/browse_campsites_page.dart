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

  final ClusterManagerId _clusterManagerId = const ClusterManagerId(
    'campsites',
  );
  late ClusterManager _clusterManager;
  final Map<ClusterManagerId, ClusterManager> _clusterManagers = {};

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    _initializeClusterManager();
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _mapController?.dispose();
    super.dispose();
  }

  void _initializeClusterManager() {
    _clusterManager = ClusterManager(
      clusterManagerId: _clusterManagerId,
      onClusterTap: (argument) {
        _mapController?.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(
                argument.position.latitude,
                argument.position.longitude,
              ),
              zoom: 4.0,
            ),
          ),
        );
      },
    );
    _clusterManagers[_clusterManagerId] = _clusterManager;
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
        clusterManagerId: _clusterManagerId,
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
        actions: [const LanguageSelector(), CampsitesFilterButton()],
      ),
      body: Stack(
        children: [
          CampsitesMap(
            campsitesAsync: campsitesAsync,
            onMapCreated: _onMapCreated,
            markers: _buildMarkers(campsitesAsync.valueOrNull ?? []),
            clusterManagers: Set<ClusterManager>.from(_clusterManagers.values),
          ),

          DraggableScrollableSheet(
            initialChildSize: 0.4,
            minChildSize: 0.2,
            maxChildSize: 0.8,
            builder: (context, scrollController) => PointerInterceptor(
              child: CampsitesList(
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
