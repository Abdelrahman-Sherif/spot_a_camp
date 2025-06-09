import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spot_a_camp/core/barrel.dart';
import 'package:spot_a_camp/features/campsites/barrel.dart';

class CampsiteFiltersPopup extends ConsumerStatefulWidget {
  const CampsiteFiltersPopup({super.key});

  @override
  ConsumerState<CampsiteFiltersPopup> createState() =>
      _CampsiteFiltersPopupState();
}

class _CampsiteFiltersPopupState extends ConsumerState<CampsiteFiltersPopup> {
  final StateNotifierProvider<TempFilterNotifier, CampsiteFilters>
  _tempFilterProvider =
      StateNotifierProvider<TempFilterNotifier, CampsiteFilters>((ref) {
        final currentFilters = ref.read(filterNotifierProvider);
        return TempFilterNotifier(currentFilters);
      });

  final TextEditingController _minPriceController = TextEditingController();
  final TextEditingController _maxPriceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final currentFilters = ref.read(filterNotifierProvider);

    _minPriceController.text = currentFilters.minPrice?.toString() ?? '';
    _maxPriceController.text = currentFilters.maxPrice?.toString() ?? '';
  }

  @override
  void dispose() {
    _minPriceController.dispose();
    _maxPriceController.dispose();
    super.dispose();
  }

  void _updateMinPrice(String value) {
    final price = double.tryParse(value);
    ref.read(_tempFilterProvider.notifier).updateMinPrice(price);
  }

  void _updateMaxPrice(String value) {
    final price = double.tryParse(value);
    ref.read(_tempFilterProvider.notifier).updateMaxPrice(price);
  }

  void _applyFilters() {
    final tempFilters = ref.read(_tempFilterProvider);
    ref.read(filterNotifierProvider.notifier).applyFilters(tempFilters);
    Navigator.of(context).pop();
  }

  void _clearFilters() {
    ref.read(_tempFilterProvider.notifier).clear();
    _minPriceController.clear();
    _maxPriceController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: CustomBorderRadius.large),
      child: Padding(
        padding: SpacingValues.pagePadding.all,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Row(
              children: [
                Icon(Icons.tune, color: theme.colorScheme.primary),
                const SizedBox(width: Spacing.small2),
                Text(l10n.filters, style: theme.textTheme.headlineSmall),
                const Spacer(),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),

            const SizedBox(height: Spacing.small3),

            // Close to Water Filter
            Consumer(
              builder: (context, ref, child) {
                final tempFilters = ref.watch(_tempFilterProvider);
                return CheckboxListTile(
                  title: Text(l10n.closeToWater),
                  subtitle: Text(l10n.closeToWaterDescription),
                  value: tempFilters.closeToWaterOnly,
                  onChanged: (value) {
                    ref
                        .read(_tempFilterProvider.notifier)
                        .updateCloseToWater(value ?? false);
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                );
              },
            ),

            // Campfire Allowed Filter
            Consumer(
              builder: (context, ref, child) {
                final tempFilters = ref.watch(_tempFilterProvider);
                return CheckboxListTile(
                  title: Text(l10n.campFireAllowed),
                  subtitle: Text(l10n.campFireAllowedDescription),
                  value: tempFilters.campFireAllowedOnly,
                  onChanged: (value) {
                    ref
                        .read(_tempFilterProvider.notifier)
                        .updateCampFireAllowed(value ?? false);
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                );
              },
            ),

            const SizedBox(height: Spacing.m),

            // Price Range
            Text(l10n.priceRange, style: theme.textTheme.titleMedium),
            const SizedBox(height: Spacing.small3),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _minPriceController,
                    decoration: InputDecoration(
                      labelText: l10n.minPrice,
                      prefixText: '€',
                      border: OutlineInputBorder(
                        borderRadius: CustomBorderRadius.medium,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: _updateMinPrice,
                  ),
                ),
                const SizedBox(width: Spacing.small3),
                Expanded(
                  child: TextField(
                    controller: _maxPriceController,
                    decoration: InputDecoration(
                      labelText: l10n.maxPrice,
                      prefixText: '€',
                      border: OutlineInputBorder(
                        borderRadius: CustomBorderRadius.medium,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: _updateMaxPrice,
                  ),
                ),
              ],
            ),

            const SizedBox(height: Spacing.l),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: theme.colorScheme.error,
                    ),
                    onPressed: _clearFilters,
                    child: Text(l10n.clearFilters),
                  ),
                ),
                const SizedBox(width: Spacing.small3),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _applyFilters,
                    child: Text(l10n.applyFilters),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
