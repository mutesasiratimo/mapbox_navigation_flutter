#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_mapbox_navigation.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'mapbox_navigation_flutter'
  s.version          = '0.3.0'
  s.summary          = 'Add Turn By Turn Navigation to Your Flutter Application Using MapBox. Never leave your app when you need to navigate your users to a location.'
  s.description      = <<-DESC
Add Turn By Turn Navigation to Your Flutter Application Using MapBox. Never leave your app when you need to navigate your users to a location.
                       DESC
  s.homepage         = 'https://mutesasira.dev'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Timothy Mutesasira' => 'mutestimo72@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'MapboxCoreNavigation', '1.2.0'
  s.dependency 'MapboxNavigation', '1.2.0'
  s.platform = :ios, '12.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 
    'DEFINES_MODULE' => 'YES', 
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386',
    'SWIFT_VERSION' => '5.0',
    'CLANG_WARN_QUOTED_INCLUDE_IN_FRAMEWORK_HEADER' => 'NO'
  }
  s.swift_version = '5.0'
end
