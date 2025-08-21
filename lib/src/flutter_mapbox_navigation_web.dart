import 'dart:async';
import 'dart:html' as html;

import 'package:flutter/foundation.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'flutter_mapbox_navigation_platform_interface.dart';
import 'models/models.dart';

/// A web implementation of the FlutterMapboxNavigationPlatform.
class FlutterMapboxNavigationWeb extends FlutterMapboxNavigationPlatform {
  static void registerWith(Registrar registrar) {
    FlutterMapboxNavigationPlatform.instance = FlutterMapboxNavigationWeb();
  }

  @override
  Future<String?> getPlatformVersion() async {
    final version = html.window.navigator.userAgent;
    return version;
  }

  @override
  Future<double?> getDistanceRemaining() async {
    // Web implementation - return null as navigation is not supported on web
    return null;
  }

  @override
  Future<double?> getDurationRemaining() async {
    // Web implementation - return null as navigation is not supported on web
    return null;
  }

  @override
  Future<bool?> startFreeDrive(MapBoxOptions options) async {
    // Web implementation - free drive is not supported on web
    return false;
  }

  @override
  Future<bool?> startNavigation(
    List<WayPoint> wayPoints,
    MapBoxOptions options,
  ) async {
    // Web implementation - navigation is not supported on web
    // Could potentially open Mapbox web navigation in a new tab
    if (wayPoints.isNotEmpty) {
      final destination = wayPoints.last;
      final origin = wayPoints.first;

      // Open Mapbox web navigation
      final url = 'https://www.mapbox.com/directions/driving/'
          '${origin.latitude},${origin.longitude};'
          '${destination.latitude},${destination.longitude}';

      html.window.open(url, '_blank');
      return true;
    }
    return false;
  }

  @override
  Future<dynamic> addWayPoints({required List<WayPoint> wayPoints}) async {
    // Web implementation - not supported
    return false;
  }

  @override
  Future<bool?> finishNavigation() async {
    // Web implementation - not supported
    return false;
  }

  @override
  Future<bool?> enableOfflineRouting() async {
    // Web implementation - offline routing is not supported on web
    return false;
  }

  @override
  Future<dynamic> registerRouteEventListener(
    ValueSetter<RouteEvent> listener,
  ) async {
    // Web implementation - no events to register
    return null;
  }
}
