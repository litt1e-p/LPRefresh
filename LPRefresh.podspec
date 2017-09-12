Pod::Spec.new do |s|
  s.name             = "LPRefresh"
  s.version          = "0.0.2"
  s.summary          = "a component to pull to refresh & scroll infinitely for load more"
  s.description      = <<-DESC
			a component to pull to refresh & scroll infinitely for load more which is base on UIRreshControl & UIScrollView+InfiniteScroll                   
		       DESC
  s.homepage         = "https://github.com/litt1e-p/LPRefresh"
  s.license          = { :type => 'MIT' }
  s.author           = { "litt1e-p" => "litt1e.p4ul@gmail.com" }
  s.source           = { :git => "https://github.com/litt1e-p/LPRefresh.git", :tag => "#{s.version}" }
  s.platform = :ios, '7.0'
  s.requires_arc = true
  s.source_files = 'LPRefresh/**/*.{h,m}'
  #s.resource_bundles = {
  #  'LPRefreshBundle' => ['LPRefresh/**/*.lproj']
  #}
  #s.dependency 'UIScrollView-InfiniteScroll'
  s.frameworks = 'Foundation', 'UIKit'
end

