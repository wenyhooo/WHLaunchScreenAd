Pod::Spec.new do |s|
  s.name         = "WHLaunchAd"
  s.version      = "1.0.0"
  s.summary      = "几行代码实现启动页广告功能"
  s.homepage     = "https://github.com/wenyhooo/WHLaunchAd"
  s.license      = 'MIT'
  s.authors      = { "wenyhooo" => "871531334@qq.com"}
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/wenyhooo/WHLaunchAd.git" ,:tag => s.version}
  s.source_files = 'Pod/Classes/**/*.{h,m,mm}'
  # s.dependency "Mantle", "~> 2.0.7" 
  s.requires_arc = true

end
