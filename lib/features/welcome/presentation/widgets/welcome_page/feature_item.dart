import 'package:flutter/material.dart';
import 'package:spot_a_camp/core/barrel.dart';

class FeatureItem extends StatelessWidget {
  const FeatureItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: CustomBorderRadius.medium,
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(width: Spacing.small3),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: Spacing.xxs),
              Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
      ],
    );
  }
}
