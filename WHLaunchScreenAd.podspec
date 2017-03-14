Pod::Spec.new do |s|
  s.name         = "WHLaunchScreenAd"
  s.version      = "1.0.1"
  s.summary      = "WHLaunchScreenAd几行代码实现启动页广告功能"
  s.homepage     = "https://github.com/wenyhooo/WHLaunchScreenAd"
  s.license      = 'MIT'
  s.authors      = { "wenyhooo" => "871531334@qq.com"}
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/wenyhooo/WHLaunchScreenAd.git" ,:tag => s.version}
  s.source_files = 'Pod/Classes/**/*.{h,m,mm}'
  s.requires_arc = true

end
