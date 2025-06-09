import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spot_a_camp/features/campsites/barrel.dart';

class CampsiteFilterNotifier extends StateNotifier<CampsiteFilters> {
  CampsiteFilterNotifier() : super(const CampsiteFilters());

  void updateCloseToWater(bool value) {
    state = state.copyWith(closeToWaterOnly: value);
  }

  void updateCampFireAllowed(bool value) {
    state = state.copyWith(campFireAllowedOnly: value);
  }

  void updateMinPrice(double? price) {
    state = state.copyWith(minPrice: price);
  }

  void updateMaxPrice(double? price) {
    state = state.copyWith(maxPrice: price);
  }

  void updatePriceRange({double? minPrice, double? maxPrice}) {
    state = state.copyWith(minPrice: minPrice, maxPrice: maxPrice);
  }

  void clearFilters() {
    state = const CampsiteFilters();
  }

  void applyFilters(CampsiteFilters filters) {
    state = filters;
  }

  bool get hasActiveFilters => state.hasActiveFilters;
}

// Separate notifier for temporary filter state during editing
class TempFilterNotifier extends StateNotifier<CampsiteFilters> {
  TempFilterNotifier(super.initialFilters);

  void updateCloseToWater(bool value) {
    state = state.copyWith(closeToWaterOnly: value);
  }

  void updateCampFireAllowed(bool value) {
    state = state.copyWith(campFireAllowedOnly: value);
  }

  void updateMinPrice(double? price) {
    state = state.copyWith(minPrice: price);
  }

  void updateMaxPrice(double? price) {
    state = state.copyWith(maxPrice: price);
  }

  void reset(CampsiteFilters filters) {
    state = filters;
  }

  void clear() {
    state = const CampsiteFilters();
  }
}
