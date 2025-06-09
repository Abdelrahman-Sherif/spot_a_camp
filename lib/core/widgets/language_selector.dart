import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spot_a_camp/core/barrel.dart';

class LanguageSelector extends ConsumerWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final currentLocale = ref.watch(localeProvider);
    final theme = Theme.of(context);

    return PopupMenuButton<Locale>(
      icon: Icon(Icons.language, color: theme.colorScheme.onSurface),
      tooltip: 'Language',
      onSelected: (Locale locale) {
        ref.read(localeProvider.notifier).state = locale;
      },
      itemBuilder: (BuildContext context) => [
        PopupMenuItem<Locale>(
          value: const Locale('en'),
          child: Row(
            children: [
              if (currentLocale.languageCode == 'en')
                Icon(Icons.check, color: theme.colorScheme.primary, size: 20),
              if (currentLocale.languageCode != 'en') const SizedBox(width: 20),
              const SizedBox(width: 8),
              Text(l10n.en),
            ],
          ),
        ),
        PopupMenuItem<Locale>(
          value: const Locale('de'),
          child: Row(
            children: [
              if (currentLocale.languageCode == 'de')
                Icon(Icons.check, color: theme.colorScheme.primary, size: 20),
              if (currentLocale.languageCode != 'de') const SizedBox(width: 20),
              const SizedBox(width: 8),
              Text(l10n.de),
            ],
          ),
        ),
      ],
    );
  }
}
