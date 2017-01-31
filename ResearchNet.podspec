Pod::Spec.new do |s|
  s.name             = "ResearchNet"
  s.version          = "0.1.4"
  s.summary          = "This IOS framework provides support for using the Researchnet backend."


  s.description      = <<-DESC
ResearchNet is the easiest way to add secure, HIPAA compliant cloud data storage
                        and user management to your ResearchKit clinical study iOS app.  Built and
                        backed by the Research Computing Division at the RTI International.
                       DESC

  s.homepage         = "https://github.com/ICTatRTI/ResearchnetSDK-IOS"
  s.license          = 'MIT'
  s.author           = { "Adam Preston" => "apreston@rti.org" }
  s.source           = { :git => "https://github.com/ICTatRTI/ResearchnetSDK-IOS.git", :tag => s.version.to_s }


  s.ios.deployment_target = '9.0'

  #s.resource_bundles = {
  #  'ResearchNet' => ['ResearchNet/Assets/*.png']
  #}

  s.source_files = 'ResearchNet/Classes/**/*'

  s.dependency 'Alamofire', '~> 4.2'

  s.dependency 'SwiftyJSON', '~> 3.1.3'
  
end
