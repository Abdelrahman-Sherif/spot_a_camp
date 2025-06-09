import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spot_a_camp/core/barrel.dart';
import 'package:spot_a_camp/features/campsites/barrel.dart';

class CampsitesList extends StatelessWidget {
  const CampsitesList({
    required this.scrollController,
    required this.searchController,
    required this.filteredCampsitesAsync,
    super.key,
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
                      onTap: () => context.push(
                        '/campsite/${campsite.id}',
                        extra: campsite,
                      ),
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
