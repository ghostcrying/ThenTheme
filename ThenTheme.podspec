Pod::Spec.new do |s|
  s.name         = "ThenTheme"
  s.version      = "0.0.1"
  s.summary      = "Theme Manager"
  s.description  = <<-EOS
  EOS
  s.homepage     = "https://github.com/ghostcrying/ThenTheme"
  s.author       = { "ghost" => "czios1501@gmail.com" }
  s.ios.deployment_target = '11.0'
  s.source       = { :git => "https://github.com/ghostcrying/ThenTheme.git", :tag => s.version }
  s.source_files = "Sources/**/*"
  s.swift_version = '5.3'
  s.cocoapods_version = '>= 1.4.0'

end

