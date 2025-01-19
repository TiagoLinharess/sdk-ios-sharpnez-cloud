Pod::Spec.new do |spec|
  spec.name         = 'SharpnezCloud'
  spec.version      = '2.0.0'
  spec.license      = { :type => 'MIT' }
  spec.homepage     = 'https://github.com/TiagoLinharess/sdk-ios-sharpnez-cloud.git'
  spec.authors      = { 'Tiago Linhares' => 'tiagolinharessouza@gmail.com' }
  spec.summary      = 'This is a software development kit'
  spec.source       = { :git => 'https://github.com/TiagoLinharess/sdk-ios-sharpnez-cloud.git', :tag => '2.0.0' }
  spec.platforms    = { :ios => "18.0" }
  spec.swift_version = '5.8.1'
  spec.source_files = 'SharpnezCloud/SharpnezCloud/**/*.swift'
  spec.framework    = 'SystemConfiguration'
end
