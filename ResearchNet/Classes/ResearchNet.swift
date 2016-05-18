import UIKit
import Alamofire
import SwiftyJSON

public class ResearchNet: NSObject {

    var host: String
    var object: RFClass = RFClass()
    
    public init(host: String) {
        self.host = host
    }
    
    public func printConfiguration() {
        
        object.printConfiguration(self.host)
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
