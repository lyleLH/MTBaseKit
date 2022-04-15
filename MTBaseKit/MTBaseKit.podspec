
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

#   s.source_files = 'MTBaseKit/Classes/Private/**/*.{h,m,mm,c,cpp,swift}'
  s.source_files = 'MTBaseKit/Classes/Interface/*.h'
  s.dependency 'YYModel'


s.subspec 'Annotate' do |ss|
       ss.ios.deployment_target = '9.0'
       ss.source_files = 'MTBaseKit/Classes/Private/Annotate/**/*.{h,m,mm,c,cpp,swift}'
       ss.public_header_files = 'MTBaseKit/Classes/Private/Annotate/**/*.h'
 end

  s.subspec 'Router' do |ss|
       ss.ios.deployment_target = '9.0'
       ss.source_files = 'MTBaseKit/Classes/Private/Router/**/*.{h,m,mm,c,cpp,swift}'
       ss.public_header_files = 'MTBaseKit/Classes/Private/Router/**/*.h'

  end

  s.subspec 'Service' do |ss|
       ss.ios.deployment_target = '9.0'
       ss.source_files = 'MTBaseKit/Classes/Private/Service/**/*.{h,m,mm,c,cpp,swift}'
       ss.public_header_files = 'MTBaseKit/Classes/Private/Service/**/*.h'

  end

end
