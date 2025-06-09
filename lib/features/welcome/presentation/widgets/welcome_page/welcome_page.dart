import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spot_a_camp/core/barrel.dart';
import 'package:spot_a_camp/features/welcome/barrel.dart';
import 'package:spot_a_camp/gen/assets.gen.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Spacing.pagePadding),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // App Logo/Icon
                    Assets.svg.camping.svg(width: 120, height: 120),
                    const SizedBox(height: Spacing.l),

                    // Welcome Text
                    Text(
                      l10n.welcomeTitle,
                      style: Theme.of(context).textTheme.displayLarge,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: Spacing.small3),

                    Text(
                      l10n.welcomeSubtitle,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppTheme.textSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: Spacing.l),

                    // Features
                    FeatureItem(
                      icon: Icons.explore_rounded,
                      title: l10n.discoverCampsitesTitle,
                      subtitle: l10n.discoverCampsitesSubtitle,
                      color: AppTheme.primaryGreen,
                    ),
                    const SizedBox(height: Spacing.small4),

                    FeatureItem(
                      icon: Icons.filter_list_rounded,
                      title: l10n.filterAndSearchTitle,
                      subtitle: l10n.filterAndSearchSubtitle,
                      color: AppTheme.accentOrange,
                    ),
                    const SizedBox(height: Spacing.small4),
                    FeatureItem(
                      icon: Icons.map_rounded,
                      title: l10n.mapViewTitle,
                      subtitle: l10n.mapViewSubtitle,
                      color: AppTheme.primaryGreenLight,
                    ),
                  ],
                ),
              ),

              // Get Started Button
              CustomButton(
                text: l10n.getStarted,
                onPressed: () => context.go('/browse'),
              ),
              const SizedBox(height: Spacing.m),
            ],
          ),
        ),
      ),
    );
  }
}
