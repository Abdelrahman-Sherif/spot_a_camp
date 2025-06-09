import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:spot_a_camp/features/campsites/barrel.dart';

class CampsitesFilterButton extends ConsumerWidget {
  const CampsitesFilterButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final filters = ref.watch(filterNotifierProvider);

    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) =>
              PointerInterceptor(child: const CampsiteFiltersPopup()),
        );
      },
      icon: Stack(
        children: [
          const Icon(Icons.tune),
          if (filters.hasActiveFilters)
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
