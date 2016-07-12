import UIKit
import Alamofire
import SwiftyJSON

public class ResearchNet: NSObject {

    var host: String
    var appKey: String
    var object: RFClass = RFClass()
    
    public init(host: String, appKey: String) {
        self.host = host
        self.appKey = appKey
    }
    
    public func printConfiguration() {
        NSLog("The host is ", host)
    }
    
    
    public func authenticateUser(completionHandler: (responseObject: String?, error: NSError?) -> (), username: String?, password: String?) {

        let parameters = [
            "username": username!,
            "password": password!
        ]
        
        Alamofire.request(.POST, "https://"+host+"/api-token-auth/", parameters: parameters)
            
            /*
             Alamofire treats any completed request to be successful, regardless of the content of the response. Calling validate before a response handler causes an error to be generated if the response had an unacceptable status code or MIME type. a swift 3 read more here: https://github.com/Alamofire/Alamofire#validation
             */
            .validate()
            //here you pass a new closure to the responseString method
            .responseJSON { response in switch response.result {
                
            case .Success(let data):
                
                let json = JSON(data)
                let token = json["token"].stringValue
                
                if token == "" {
                    print("unable to login: " , json["non_field_errors"][0] )
                    completionHandler(responseObject: token as String!, error: nil)
                    
                } else { // Sucessussful Login
                    print("logged in, there")
                    completionHandler(responseObject: token as String!, error: nil)
                }
                
            case .Failure(let responseError):
                
                print("Request failed with error: \(responseError)")
                completionHandler(responseObject: "hello" as String!, error: responseError)
                
            }
                
        }
    }


    public func forgotPassword(completionHandler: (responseObject: String?, error: NSError?) -> (), email: String?) {
        
        let parameters = [
            "email": email!,

        ]
        
        // Call to forgot password API (doesn't exist yet)
        print("forgot password for", email )

    }

    
    public func submitSurveyResponse(completionHandler: (responseObject: String?, error: NSError?) -> (), username: String?, password: String?, first_name: String?, last_name: String?, gender: String?, dob: String?) {
        
        // call to submit api http://researchnet-documentation.s3-website-us-east-1.amazonaws.com/api/#survey-submission
        
        
        let parameters = [
            "username": username!,
            "password": password!,
            "first_name": first_name!,
            "last_name": last_name!,
            "gender": gender!,
            "dob": dob!,
            "email": username!
        ]
        
        let headers = [
            "Authorization": "Token \(appKey)"
        ]
        
        Alamofire.request(.POST, "https://"+host+"/participant/", headers: headers, parameters: parameters)
            
            /*
             Alamofire treats any completed request to be successful, regardless of the content of the response. Calling validate before a response handler causes an error to be generated if the response had an unacceptable status code or MIME type. a swift 3 read more here: https://github.com/Alamofire/Alamofire#validation
             */
            .validate()
            //here you pass a new closure to the responseString method
            .responseJSON { response in switch response.result {
                
            case .Success(let data):
                print("yay!")
            
            case .Failure(let responseError):
                
                print("Request failed with error: \(responseError)")
                completionHandler(responseObject: "hello" as String!, error: responseError)
                
                
            }
        }
    
    }


}
