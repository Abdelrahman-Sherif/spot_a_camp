part of 'campsite_detail_page.dart';

class _LocationSection extends StatelessWidget {
  const _LocationSection({required this.campsite});

  final Campsite campsite;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.location,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: Spacing.small2),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(Spacing.small2),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest,
            borderRadius: CustomBorderRadius.medium,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: theme.colorScheme.primary,
                    size: 20,
                  ),
                  const SizedBox(width: Spacing.small1),
                  Expanded(
                    child: Text(
                      'Lat: ${campsite.geoLocation.lat.toStringAsFixed(6)}, '
                      'Long: ${campsite.geoLocation.long.toStringAsFixed(6)}',
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: Spacing.small2),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      final location =
                          '${campsite.geoLocation.lat},${campsite.geoLocation.long}';
                      Clipboard.setData(ClipboardData(text: location));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '${l10n.shareLocation} copied to clipboard',
                          ),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                    icon: const Icon(Icons.copy, size: 16),
                  ),
                  const SizedBox(width: Spacing.small1),
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          final success = await MapLauncher.openNavigation(
                            latitude: campsite.geoLocation.lat,
                            longitude: campsite.geoLocation.long,
                            label: campsite.label,
                          );

                          if (!success && context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Could not open map application'),
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          }
                        },
                        icon: const Icon(Icons.directions),
                        label: Text(l10n.getDirections),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
