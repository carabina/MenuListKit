Pod::Spec.new do |s|
  s.name             = 'IGMenuListKit'
  s.version          = '0.0.4'
  s.summary          = 'A fast way to create lists and menus in Swift'
  s.description      = 'A fast way to create lists and menus with declarative programming in Swift'

  s.homepage     = "https://github.com/iGenius-Srl/MenuListKit"
  s.license          = "Apache 2.0"
  s.author           = { 'iGenius-Srl' => 'mobile@igenius.net' }
  s.source           = { :git => 'https://github.com/iGenius-Srl/MenuListKit.git', :tag => s.version.to_s }


  s.ios.deployment_target = '9.0'

  s.source_files = 'MenuListKit/Classes/**/*'

  s.dependency 'IGListKit'
end
