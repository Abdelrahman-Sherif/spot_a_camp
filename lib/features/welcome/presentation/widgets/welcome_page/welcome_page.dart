import 'package:flutter/material.dart';
import 'package:spot_a_camp/core/barrel.dart';
import 'package:spot_a_camp/features/welcome/barrel.dart';

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
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppTheme.primaryGreen,
                            AppTheme.primaryGreenLight,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(
                        Icons.outdoor_grill_rounded,
                        size: 60,
                        color: Colors.white,
                      ),
                    ),
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
                    const SizedBox(height: Spacing.xl),

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
              CustomButton(text: l10n.getStarted, onPressed: () {}),
              const SizedBox(height: Spacing.m),
            ],
          ),
        ),
      ),
    );
  }
}
