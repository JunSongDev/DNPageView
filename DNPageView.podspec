Pod::Spec.new do |s|

  s.name         = "DNPageView"
  s.version      = "0.0.1"
  s.summary      = "page view"
  s.description  = <<-DESC
                    a sample pageView
                   DESC

  s.homepage     = "https://github.com/iOS-dn/DNPageView"
  s.license      = "MIT"

  s.author             = { "zjs_962464@163.com" => "zjs_962464@163.com" }
  s.platform     = :ios

  s.source       = { :git => "https://github.com/iOS-dn/DNPageView.git", :tag => "#{s.version}" }

  s.source_files  = "DNPageView", "DNPageView/**/*.{h,m}"

end
