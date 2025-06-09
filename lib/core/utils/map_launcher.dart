import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class MapLauncher {
  static Future<bool> openMap({
    required double latitude,
    required double longitude,
    String? label,
  }) async {
    // Create a label for the location if provided
    final locationLabel = label != null ? Uri.encodeComponent(label) : '';

    // Try platform-specific apps first, then fall back to web URLs
    if (Platform.isIOS) {
      // Try Apple Maps first
      final appleMapUrl = Uri.parse(
        'maps://?q=$latitude,$longitude${label != null ? '&ll=$latitude,$longitude' : ''}',
      );

      if (await canLaunchUrl(appleMapUrl)) {
        return await launchUrl(appleMapUrl);
      }
    }

    if (Platform.isAndroid) {
      // Try Google Maps app first
      final googleMapUrl = Uri.parse(
        'google.navigation:q=$latitude,$longitude${label != null ? '&label=$locationLabel' : ''}',
      );

      if (await canLaunchUrl(googleMapUrl)) {
        return await launchUrl(googleMapUrl);
      }
    }

    // Fallback to web-based Google Maps (works on all platforms)
    final webMapUrl = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude${label != null ? '&query_place_id=$locationLabel' : ''}',
    );

    if (await canLaunchUrl(webMapUrl)) {
      return await launchUrl(webMapUrl, mode: LaunchMode.externalApplication);
    }

    return false;
  }

  /// Opens turn-by-turn navigation to the specified location
  static Future<bool> openNavigation({
    required double latitude,
    required double longitude,
    String? label,
  }) async {
    if (!kIsWeb) {
      if (Platform.isIOS) {
        // Apple Maps navigation
        final appleNavUrl = Uri.parse(
          'maps://?daddr=$latitude,$longitude&dirflg=d',
        );

        if (await canLaunchUrl(appleNavUrl)) {
          return await launchUrl(appleNavUrl);
        }
      }

      if (Platform.isAndroid) {
        // Google Maps navigation
        final googleNavUrl = Uri.parse(
          'google.navigation:q=$latitude,$longitude&mode=d',
        );

        if (await canLaunchUrl(googleNavUrl)) {
          return await launchUrl(googleNavUrl);
        }
      }
    }

    // Fallback to web-based Google Maps directions
    final webNavUrl = Uri.parse(
      'https://www.google.com/maps/dir/?api=1&destination=$latitude,$longitude&travelmode=driving',
    );

    if (await canLaunchUrl(webNavUrl)) {
      return await launchUrl(webNavUrl, mode: LaunchMode.externalApplication);
    }

    return false;
  }
}
