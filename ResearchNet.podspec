#
# Be sure to run `pod lib lint ResearchNet.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "ResearchNet"
  s.version          = "0.1.0"
  s.summary          = "This IOS framework provides support for using the Researchnet backend."


  s.description      = <<-DESC
CMHealth is the easiest way to add secure, HIPAA compliant cloud data storage
                        and user management to your ResearchKit clinical study iOS app.  Built and
                        backed by the Research Computing Division at the RTI International.
                       DESC

  s.homepage         = "https://bitbucket.org/rcdrti/researchnetsdk-ios"
  s.license          = 'MIT'
  s.author           = { "Adam Preston" => "apreston@rti.org" }
  s.source           = { :git => "https://adam704a@bitbucket.org/rcdrti/researchnetsdk-ios.git", :tag => s.version.to_s }


  s.ios.deployment_target = '9.0'

  s.source_files = 'ResearchNet/Classes/**/*'
  

end
