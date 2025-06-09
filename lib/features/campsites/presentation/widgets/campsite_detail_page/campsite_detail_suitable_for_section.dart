part of 'campsite_detail_page.dart';

class _SuitableForSection extends StatelessWidget {
  const _SuitableForSection({required this.campsite});

  final Campsite campsite;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    if (campsite.suitableFor.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.suitableFor,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: Spacing.small2),
        Wrap(
          spacing: Spacing.small1,
          runSpacing: Spacing.small1,
          children: campsite.suitableFor
              .map(
                (suitable) => Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Spacing.small2,
                    vertical: Spacing.small1,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.tertiaryContainer,
                    borderRadius: CustomBorderRadius.medium,
                  ),
                  child: Text(
                    suitable,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onTertiaryContainer,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
