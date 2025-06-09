import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:spot_a_camp/core/barrel.dart';
import 'package:spot_a_camp/features/campsites/barrel.dart';

class CampsiteListItem extends StatelessWidget {
  const CampsiteListItem({required this.campsite, this.onTap, super.key});

  final Campsite campsite;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: Spacing.small3,
        vertical: Spacing.small1,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: CustomBorderRadius.medium,
        child: Padding(
          padding: const EdgeInsets.all(Spacing.small2),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Campsite photo
              ClipRRect(
                borderRadius: CustomBorderRadius.small,
                child: CachedNetworkImage(
                  imageUrl: campsite.photo,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    width: 80,
                    height: 80,
                    color: theme.colorScheme.surfaceContainerHighest,
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                  errorWidget: (context, url, error) => Container(
                    width: 80,
                    height: 80,
                    color: theme.colorScheme.surfaceContainerHighest,
                    child: const Icon(Icons.image_not_supported),
                  ),
                ),
              ),
              const SizedBox.square(dimension: Spacing.small2),

              // Campsite details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Campsite name
                    Text(
                      campsite.label,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox.square(dimension: Spacing.xs),

                    // Price
                    Text(
                      '${l10n.euros}${campsite.pricePerNight.toStringAsFixed(2)} ${l10n.pricePerNight.toLowerCase()}',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox.square(dimension: Spacing.small1),

                    // Features
                    Wrap(
                      spacing: Spacing.small1,
                      runSpacing: Spacing.xs,
                      children: [
                        if (campsite.isCloseToWater)
                          FeatureChip(
                            icon: Icons.water_drop,
                            label: l10n.closeToWater,
                          ),
                        if (campsite.isCampFireAllowed)
                          FeatureChip(
                            icon: Icons.local_fire_department,
                            label: l10n.campFireAllowed,
                          ),
                        if (campsite.hostLanguages.isNotEmpty)
                          FeatureChip(
                            icon: Icons.language,
                            label: campsite.hostLanguages
                                .map((e) => e.label(l10n: l10n))
                                .join(l10n.listSeparator),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
