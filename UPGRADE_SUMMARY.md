# Flutter Mapbox Navigation Plugin - Major Update Summary

## Overview
This document summarizes the comprehensive modernization of the Flutter Mapbox Navigation plugin from version 0.2.2 to 0.3.0. The plugin has been updated to support modern Flutter 3.x and latest platform versions.

## Breaking Changes

### Flutter SDK Requirements
- **Old**: `sdk: '>=2.19.4 <4.0.0'`
- **New**: `sdk: '>=3.0.0 <4.0.0'`
- **Old**: `flutter: ">=2.5.0"`
- **New**: `flutter: ">=3.10.0"`

### Platform Minimum Versions
- **Android**: Updated from minSdkVersion 21 to 23 (Android 6.0)
- **iOS**: Updated from iOS 12.0 to iOS 16.0
- **macOS**: Updated from macOS 10.14 to macOS 10.15

## Android Updates

### Build Tools & Dependencies
- **Android Gradle Plugin**: 7.4.2 → 8.2.2
- **Kotlin**: 1.7.10 → 1.9.22
- **Gradle Wrapper**: 7.6.1 → 8.2
- **compileSdk & targetSdk**: 33 → 34
- **Java Compatibility**: 1.8 → 17

### Mapbox Navigation SDK
- **Old**: 2.16.0
- **New**: 3.0.0

### Updated Dependencies
- **androidx.core:core-ktx**: 1.9.0 → 1.12.0
- **com.google.android.material**: 1.8.0 → 1.11.0
- **com.google.android.gms:play-services-location**: 21.0.1 → 21.1.0
- **com.jakewharton.timber**: 4.7.1 → 5.0.1
- **com.google.code.gson**: 2.8.9 → 2.10.1
- **org.jetbrains.kotlinx:kotlinx-coroutines**: 1.6.4 → 1.7.3
- **androidx.annotation**: 1.6.0 → 1.7.1
- **com.squareup.leakcanary**: 2.9.1 → 2.12

### Build Configuration
- Added `namespace` declaration in build.gradle
- Removed `package` attribute from AndroidManifest.xml (using namespace instead)
- Updated to use `kotlin-stdlib-jdk8` instead of `kotlin-stdlib-jdk7`
- Converted NavigationLauncher from Java to Kotlin (modern Android standard)

## iOS Updates

### Mapbox Navigation SDK
- **Old**: ~> 2.11
- **New**: ~> 3.0

### Deployment Target
- **Old**: iOS 12.0
- **New**: iOS 16.0

### Podfile Updates
- Updated iOS deployment target in example app
- Updated Xcode project settings

## macOS Updates

### Mapbox Navigation SDK
- **Old**: Not specified
- **New**: ~> 3.0

### Deployment Target
- **Old**: macOS 10.14
- **New**: macOS 10.15

### Implementation
- Created proper macOS plugin implementation
- Updated podspec with correct dependencies

## Flutter Dependencies

### Core Dependencies
- **plugin_platform_interface**: ^2.0.2 → ^3.0.0
- **very_good_analysis**: ^5.0.0+1 (unchanged)

### Dev Dependencies
- **flutter_lints**: ^2.0.0 → ^3.0.0

### Example App Dependencies
- **cupertino_icons**: ^1.0.2 → ^1.0.6

## Platform Support

### Enabled Platforms
All platforms are now enabled in pubspec.yaml:
- ✅ Android
- ✅ iOS  
- ✅ Linux
- ✅ macOS
- ✅ Windows
- ✅ Web

### New Platform Implementations

#### Web Implementation
- Created `flutter_mapbox_navigation_web.dart`
- Provides fallback to Mapbox web navigation
- Returns appropriate null/false values for unsupported features

#### Linux Implementation
- Created `flutter_mapbox_navigation_plugin.cc`
- Basic platform version reporting
- Returns NotImplemented for navigation features

#### Windows Implementation
- Updated `flutter_mapbox_navigation_plugin.cpp`
- Modern C++ implementation
- Platform version reporting
- Returns NotImplemented for navigation features

#### macOS Implementation
- Updated `FlutterMapboxNavigationPlugin.swift`
- Proper method channel implementation
- Returns appropriate values for all methods

## Code Quality Improvements

### Analysis Options
- Updated to use modern Flutter linting rules
- Maintained very_good_analysis configuration

### Plugin Structure
- Modernized plugin registration patterns
- Updated method channel implementations
- Improved error handling

## Version History

### New Version: 0.3.0
- **Major Update**: Modernized plugin for Flutter 3.x and latest platform versions
- **Breaking Changes**: Updated SDK constraints and platform minimums
- **Android Updates**: Complete build system modernization
- **iOS Updates**: Latest Mapbox SDK and deployment target
- **macOS Updates**: Proper implementation and dependencies
- **Platform Support**: All platforms now enabled with implementations
- **Dependencies**: Updated to latest compatible versions

## Migration Guide

### For Plugin Users
1. **Update Flutter SDK**: Ensure you're using Flutter 3.10.0 or higher
2. **Update Dependencies**: Update your app's dependencies to compatible versions
3. **Platform Requirements**: Ensure your app targets the new minimum platform versions (iOS 16.0+)
4. **Test Thoroughly**: Test navigation functionality on all target platforms

### For Plugin Developers
1. **Build Environment**: Update your development environment to use the new build tools
2. **Dependencies**: Update any custom dependencies to match the new versions
3. **Platform Testing**: Test on all supported platforms
4. **Documentation**: Update any platform-specific documentation

## Testing

### Build Verification
- ✅ Plugin builds successfully with new dependencies
- ✅ Example app builds successfully
- ✅ No analysis issues found
- ✅ All platform implementations compile

### Next Steps
1. **Integration Testing**: Test with real Mapbox tokens
2. **Platform Testing**: Test on actual devices/simulators
3. **Performance Testing**: Verify performance with new SDK versions
4. **Documentation**: Update README and API documentation

## Notes

- The plugin now requires a Mapbox access token for full functionality
- Web implementation provides limited functionality (opens Mapbox web navigation)
- Desktop platforms (Linux, Windows, macOS) have basic implementations
- Full navigation features are only available on mobile platforms (Android, iOS)
- All breaking changes are documented in the CHANGELOG.md

This update brings the plugin in line with modern Flutter development practices and ensures compatibility with current platform versions and SDKs.
