#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint qr_code_utils_ios.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'qr_code_utils_ios'
  s.version          = '0.0.1'
  s.summary          = 'The flutter plugin for iOS to decode QRCodes'
  s.description      = <<-DESC
  The flutter plugin for iOS to decode QRCodes.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'ATECH' => 'josuemanuelcapita@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
