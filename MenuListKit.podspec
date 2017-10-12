#
# Be sure to run `pod lib lint MenuListKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MenuListKit'
  s.version          = '0.0.1'
  s.summary          = 'Declaratively create menus with less Swift code on iOS leveraging IGListKit'

  s.description      = <<-DESC
A Kit to create fast and simple menu
                       DESC

  s.homepage     = "https://github.com/MoonCoders/MenuListKit"
  s.license          = "Apache 2.0"
  s.author           = { 'mooncoders' => 'hello@mooncoders.co' }
  s.source           = { :git => 'https://github.com/MoonCoders/MenuListKit', :tag => s.version.to_s }


  s.ios.deployment_target = '8.0'

  s.source_files = 'MenuListKit/Classes/**/*'

  # s.resource_bundles = {
  #   'MenuListKit' => ['MenuListKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.dependency 'IGListKit', '~> 3.0.0'
end
