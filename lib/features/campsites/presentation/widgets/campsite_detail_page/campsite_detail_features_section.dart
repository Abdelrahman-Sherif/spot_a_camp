part of 'campsite_detail_page.dart';

class _FeaturesSection extends StatelessWidget {
  const _FeaturesSection({required this.campsite});

  final Campsite campsite;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.amenities,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: Spacing.small2),
        Wrap(
          spacing: Spacing.small2,
          runSpacing: Spacing.small1,
          children: [
            if (campsite.isCloseToWater)
              FeatureChip(icon: Icons.water_drop, label: l10n.closeToWater),
            if (campsite.isCampFireAllowed)
              FeatureChip(
                icon: Icons.local_fire_department,
                label: l10n.campFireAllowed,
              ),
            if (campsite.hostLanguages.isNotEmpty)
              FeatureChip(
                icon: Icons.language,
                label: () {
                  final languages = campsite.hostLanguages
                      .map((e) => e.label(l10n: l10n))
                      .join(l10n.listSeparator);

                  return '${l10n.hostLanguages}: $languages';
                }(),
              ),
          ],
        ),
      ],
    );
  }
}
