import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spot_a_camp/features/campsites/barrel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'campsite_filter_notifier.freezed.dart';

@freezed
abstract class TempFilterState with _$TempFilterState {
  const factory TempFilterState({
    required CampsiteFilters filters,
    @Default(false) bool showValidationError,
  }) = _TempFilterState;
}

class CampsiteFilterNotifier extends StateNotifier<CampsiteFilters> {
  CampsiteFilterNotifier() : super(const CampsiteFilters());

  void clearFilters() {
    state = const CampsiteFilters();
  }

  void applyFilters(CampsiteFilters filters) {
    state = filters;
  }

  bool get hasActiveFilters => state.hasActiveFilters;
}

// Separate notifier for temporary filter state during editing with validation
class TempFilterNotifier extends StateNotifier<TempFilterState> {
  TempFilterNotifier(CampsiteFilters initialFilters)
    : super(TempFilterState(filters: initialFilters));

  void updateCloseToWater(bool value) {
    state = state.copyWith(
      filters: state.filters.copyWith(closeToWaterOnly: value),
    );
  }

  void updateCampFireAllowed(bool value) {
    state = state.copyWith(
      filters: state.filters.copyWith(campFireAllowedOnly: value),
    );
  }

  void updateMinPrice(double? price) {
    state = state.copyWith(
      filters: state.filters.copyWith(minPrice: price),
      showValidationError: false, // Clear error when user types
    );
  }

  void updateMaxPrice(double? price) {
    state = state.copyWith(
      filters: state.filters.copyWith(maxPrice: price),
      showValidationError: false, // Clear error when user types
    );
  }

  bool validateAndShowError() {
    if (!state.filters.hasValidPriceRange) {
      state = state.copyWith(showValidationError: true);
      return false;
    }
    return true;
  }

  void clearValidationError() {
    state = state.copyWith(showValidationError: false);
  }

  void reset(CampsiteFilters filters) {
    state = TempFilterState(filters: filters);
  }

  void clear() {
    state = const TempFilterState(filters: CampsiteFilters());
  }
}
