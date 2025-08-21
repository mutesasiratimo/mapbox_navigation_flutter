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
  s.dependency 'MapboxCoreNavigation', '~> 2.11.0'
  s.dependency 'MapboxNavigation', '~> 2.11.0'
  s.platform = :osx, '10.15'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end
