import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'package:flutter_mapbox_navigation/src/flutter_mapbox_navigation_platform_interface.dart';
import 'package:flutter_mapbox_navigation/src/models/models.dart';

/// A web implementation of the FlutterMapboxNavigationPlatform.
///
/// Note: Web platform support is limited and most navigation features
/// are not available on web. This implementation provides basic
/// compatibility but returns null/false for most operations.
class FlutterMapboxNavigationWeb extends FlutterMapboxNavigationPlatform {
  /// Registers the web implementation with the Flutter engine.
  static void registerWith(Registrar registrar) {
    FlutterMapboxNavigationPlatform.instance = FlutterMapboxNavigationWeb();
  }

  @override
  Future<String?> getPlatformVersion() async {
    // Web implementation - return a placeholder as html is deprecated
    return 'Web platform not fully supported';
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
      // TODO(mutesasira): Implement web navigation using modern web APIs
      // final destination = wayPoints.last;
      // final origin = wayPoints.first;

      // Web implementation - navigation is not fully supported
      // Could potentially open Mapbox web navigation in a new tab
      // but html is deprecated, so returning false for now
      return false;
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
