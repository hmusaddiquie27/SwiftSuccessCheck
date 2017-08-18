Pod::Spec.new do |s|
  s.name     = 'SwiftSuccessCheck'
  s.version  = '0.0.1'
  s.license  =  { :type => 'MIT', :file => 'LICENSE' }
  s.summary  = 'Animated success tick with completion block developed in swift 3'
  s.homepage = 'https://github.com/hmusaddiquie27/SwiftSuccessCheck'
  s.author   = 'Musaddiquie Husain'
  s.source   = { :git => 'https://github.com/hmusaddiquie27/SwiftSuccessCheck.git', :tag => s.version }
  s.platform = :ios, '8.0'
  s.source_files = 'SwiftSuccessCheck/Sources/SuccessCheck.swift'
  s.requires_arc = true
end