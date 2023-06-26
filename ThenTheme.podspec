Pod::Spec.new do |s|
  s.name         = "ThenTheme"
  s.version      = "0.0.2"
  s.summary      = "Then Theme Manager"
  s.description  = <<-EOS
  😂
  EOS
  s.homepage     = "https://github.com/ghostcrying/ThenTheme"
  s.author       = { "ghost" => "czios1501@gmail.com" }
  s.license      = "BD"
  s.source       = { :git => "https://github.com/ghostcrying/ThenTheme.git", :tag => s.version }
  
  s.ios.deployment_target = '11.0'
  s.osx.deployment_target = '10.15'
  s.tvos.deployment_target = '11.0'
  
  s.source_files = "Sources/**/*.swift"
  
  s.swift_version = '5.0'
  
  s.cocoapods_version = '>= 1.4.0'
  
  s.frameworks = 'Foundation'
  
end

