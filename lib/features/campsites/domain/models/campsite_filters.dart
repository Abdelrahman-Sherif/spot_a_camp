import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spot_a_camp/features/campsites/barrel.dart';

part 'campsite_filters.freezed.dart';

@freezed
abstract class CampsiteFilters with _$CampsiteFilters {
  const factory CampsiteFilters({
    @Default(false) bool closeToWaterOnly,
    @Default(false) bool campFireAllowedOnly,
    double? minPrice,
    double? maxPrice,
  }) = _CampsiteFilters;

  const CampsiteFilters._();

  bool get hasActiveFilters =>
      closeToWaterOnly ||
      campFireAllowedOnly ||
      minPrice != null ||
      maxPrice != null;

  bool get hasValidPriceRange {
    if (minPrice == null && maxPrice == null) return true;
    if (minPrice == null || maxPrice == null) return true;
    return maxPrice! >= minPrice!;
  }

  bool matchesCampsite(Campsite campsite) {
    if (closeToWaterOnly && !campsite.isCloseToWater) {
      return false;
    }

    if (campFireAllowedOnly && !campsite.isCampFireAllowed) {
      return false;
    }

    // Only apply price filters if the price range is valid
    if (hasValidPriceRange) {
      if (minPrice != null && campsite.pricePerNight < minPrice!) {
        return false;
      }

      if (maxPrice != null && campsite.pricePerNight > maxPrice!) {
        return false;
      }
    }

    return true;
  }
}
