
Pod::Spec.new do |s|
  s.name             = 'MTBaseKit'
  s.version          = '0.1.0'
  s.summary          = 'A short description of MTBaseKit.'
  s.description      = <<-DESC
  基础组件 1.静态函数到Mach_O 并在启动时获取到静态函数指针
                       DESC

  s.homepage         = 'https://github.com/Major Tom/MTBaseKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Major Tom' => 'v2top1@163.com' }
  s.source           = { :git => 'https://github.com/Major Tom/MTBaseKit.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '9.0'

  s.source_files = 'MTBaseKit/Classes/**/*.{h,m,mm,c,cpp,swift}'
  s.public_header_files = 'MTBaseKit/Classes/Interface/**/*.h'
  s.dependency 'YYModel'
 
end
