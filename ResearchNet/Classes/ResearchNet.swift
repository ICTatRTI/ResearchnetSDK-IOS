import UIKit


public class ResearchNet {

    public var host: String = ""

    public static let sharedInstance = ResearchNet()

    
    public func printConfiguration() {
         NSLog("The host is %@", host);
        //object.printConfiguration(self.host)
    }

    public func authenticate(username: String, password: String){
        
        print("authenticate" )

    }

    public func forgotPassword(email: String){

        print("forgot password " )

    }

    public func submitSurveyResponse(){

        print("submit survey response" )
    }
    
}
