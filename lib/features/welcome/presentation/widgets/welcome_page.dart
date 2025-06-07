import 'package:flutter/material.dart';
import 'package:spot_a_camp/core/barrel.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(context.l10n.welcome)));
  }
}
