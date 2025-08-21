import Flutter
import Foundation

public class FlutterMapboxNavigationPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_mapbox_navigation", binaryMessenger: registrar.messenger())
    let instance = FlutterMapboxNavigationPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("macOS " + ProcessInfo.processInfo.operatingSystemVersionString)
    case "getDistanceRemaining":
      result(nil)
    case "getDurationRemaining":
      result(nil)
    case "startFreeDrive":
      result(false)
    case "startNavigation":
      result(false)
    case "addWayPoints":
      result(false)
    case "finishNavigation":
      result(false)
    case "enableOfflineRouting":
      result(false)
    case "registerRouteEventListener":
      result(nil)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
