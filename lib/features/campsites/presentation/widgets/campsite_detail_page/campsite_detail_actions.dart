part of 'campsite_detail_page.dart';

class _ActionButtons extends StatelessWidget {
  const _ActionButtons({required this.campsite});

  final Campsite campsite;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () {
              // This should handle booking logic, but there is no Endpoint for that yet :)
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${l10n.bookNow} - ${campsite.label}'),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            icon: const Icon(Icons.book_online),
            label: Text(l10n.bookNow),
          ),
        ),
        const SizedBox(height: Spacing.small2),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {
              // This should handle contact host logic, but there is no Endpoint for that yet :)
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${l10n.contactHost} - ${campsite.label}'),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            icon: const Icon(Icons.message),
            label: Text(l10n.contactHost),
          ),
        ),
      ],
    );
  }
}
