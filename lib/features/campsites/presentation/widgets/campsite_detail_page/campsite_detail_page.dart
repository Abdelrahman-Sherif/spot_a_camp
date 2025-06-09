import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import 'package:spot_a_camp/core/barrel.dart';
import 'package:spot_a_camp/features/campsites/barrel.dart';

part 'campsite_detail_location_section.dart';
part 'campsite_detail_suitable_for_section.dart';
part 'campsite_detail_actions.dart';
part 'campsite_detail_features_section.dart';

class CampsiteDetailPage extends StatelessWidget {
  const CampsiteDetailPage({required this.campsite, super.key});

  final Campsite campsite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _HeroImageSliver(campsite: campsite),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(Spacing.pagePadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _TitleSection(campsite: campsite),
                  const SizedBox(height: Spacing.small4),
                  _PriceSection(campsite: campsite),
                  const SizedBox(height: Spacing.small4),
                  _FeaturesSection(campsite: campsite),
                  const SizedBox(height: Spacing.small4),
                  _LocationSection(campsite: campsite),
                  const SizedBox(height: Spacing.small4),
                  _SuitableForSection(campsite: campsite),
                  const SizedBox(height: Spacing.small4),
                  _ListingDateSection(campsite: campsite),
                  const SizedBox(height: Spacing.l),
                  _ActionButtons(campsite: campsite),
                  const SizedBox(height: Spacing.small4),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroImageSliver extends StatelessWidget {
  const _HeroImageSliver({required this.campsite});

  final Campsite campsite;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverAppBar(
      expandedHeight: 300,
      pinned: true,
      stretch: true,
      backgroundColor: theme.colorScheme.surface,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: [StretchMode.zoomBackground],
        background: CachedNetworkImage(
          imageUrl: campsite.photo,
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(
            color: theme.colorScheme.surfaceContainerHighest,
            child: const Center(child: CircularProgressIndicator()),
          ),
          errorWidget: (context, url, error) => Container(
            color: theme.colorScheme.surfaceContainerHighest,
            child: const Icon(Icons.image_not_supported, size: 64),
          ),
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      automaticallyImplyLeading: true,
    );
  }
}

class _TitleSection extends StatelessWidget {
  const _TitleSection({required this.campsite});

  final Campsite campsite;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text(
      campsite.label,
      style: theme.textTheme.displaySmall?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _PriceSection extends StatelessWidget {
  const _PriceSection({required this.campsite});

  final Campsite campsite;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(Spacing.small3),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: CustomBorderRadius.medium,
      ),
      child: Row(
        children: [
          Icon(
            Icons.euro,
            color: theme.colorScheme.onPrimaryContainer,
            size: 28,
          ),
          const SizedBox(width: Spacing.small1),
          Text(
            '${campsite.pricePerNight.toStringAsFixed(2)} ${l10n.pricePerNight.toLowerCase()}',
            style: theme.textTheme.headlineMedium?.copyWith(
              color: theme.colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _ListingDateSection extends StatelessWidget {
  const _ListingDateSection({required this.campsite});

  final Campsite campsite;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final dateFormat = DateFormat.yMMMd();

    return Row(
      children: [
        Icon(
          Icons.calendar_today,
          color: theme.colorScheme.onSurfaceVariant,
          size: 18,
        ),
        const SizedBox(width: Spacing.small1),
        Text(
          '${l10n.createdOn} ${dateFormat.format(campsite.createdAt)}',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
