#include "include/flutter_mapbox_navigation/flutter_mapbox_navigation_plugin.h"

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>
#include <flutter/standard_method_codec.h>
#include <windows.h>

#include <memory>
#include <string>

namespace {

class FlutterMapboxNavigationPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows* registrar);

  FlutterMapboxNavigationPlugin();

  virtual ~FlutterMapboxNavigationPlugin();

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue>& method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

// static
void FlutterMapboxNavigationPlugin::RegisterWithRegistrar(
    flutter::PluginRegistrarWindows* registrar) {
  auto channel =
      std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
          registrar->messenger(), "flutter_mapbox_navigation",
          &flutter::StandardMethodCodec::GetInstance());

  auto plugin = std::make_unique<FlutterMapboxNavigationPlugin>();

  channel->SetMethodCallHandler(
      [plugin_pointer = plugin.get()](const auto& call, auto result) {
        plugin_pointer->HandleMethodCall(call, std::move(result));
      });

  registrar->AddPlugin(std::move(plugin));
}

FlutterMapboxNavigationPlugin::FlutterMapboxNavigationPlugin() {}

FlutterMapboxNavigationPlugin::~FlutterMapboxNavigationPlugin() {}

void FlutterMapboxNavigationPlugin::HandleMethodCall(
    const flutter::MethodCall<flutter::EncodableValue>& method_call,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result) {
  if (method_call.method_name().compare("getPlatformVersion") == 0) {
    std::string version = "Windows ";
    OSVERSIONINFO osvi;
    ZeroMemory(&osvi, sizeof(OSVERSIONINFO));
    osvi.dwOSVersionInfoSize = sizeof(OSVERSIONINFO);
    GetVersionEx(&osvi);
    version += std::to_string(osvi.dwMajorVersion) + "." + 
               std::to_string(osvi.dwMinorVersion);
    result->Success(flutter::EncodableValue(version));
  } else {
    result->NotImplemented();
  }
}

}  // namespace

void FlutterMapboxNavigationPluginRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  FlutterMapboxNavigationPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
