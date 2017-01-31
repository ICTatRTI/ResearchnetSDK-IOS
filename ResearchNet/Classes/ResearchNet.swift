import UIKit
import Alamofire
import SwiftyJSON

open class ResearchNet: NSObject {

    var host: String
    var appKey: String

    
    public init(host: String, appKey: String) {
        self.host = host
        self.appKey = appKey
    }
    
    open func printConfiguration() {
        NSLog("The host is ", host)
    }
    
    
    open func enrollUser(_ completionHandler: @escaping (_ responseObject:HTTPURLResponse?, _ error: Error?) -> (), username: String?, password: String?, first_name: String?, last_name: String?, gender: String?, dob: String?) {
        
        let parameters: Parameters = [
            "username": username,
            "password": password,
            "first_name": first_name,
            "last_name": last_name,
            "gender": gender,
            "email": username,
            "dob": dob
        ]
        
        // Enrolling users require the app key (because the user doesn't have a key of their own yet.
        // Only use the appKey here!
        
        let headers: HTTPHeaders = [
            "Authorization": "Token \(appKey)"
        ]
        
        
         Alamofire.request("https://"+host+"/participant/",  method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseJSON { response in switch response.result {

                
            case .success(let data):
                
                completionHandler(response.response, nil)
                
            case .failure(let responseError):
 
                print(NSString(data: (response.request?.httpBody)!, encoding: String.Encoding.utf8.rawValue))
                
                if let requestBody = response.data {
                    do {
                        
                        let resp = response.request!.httpBody
                        
                        let jsonArray = try JSONSerialization.jsonObject(with: requestBody, options: [])
                        print("Array: \(jsonArray)")
                        print("Error Description: \(responseError.localizedDescription)")
                        

                    }
                    catch {
                        print("Error: \(responseError)")
                    }
                }
                
                completionHandler(response.response ,  responseError)
                
                }
        }
        
        
    }
    
    
    open func authenticateUser(_ completionHandler: @escaping (_ responseObject: String?, _ error: Error?) -> (), username: String?, password: String?) {

        let parameters: Parameters = [
            "username": username!,
            "password": password!
        ]
        
        Alamofire.request("https://"+host+"/api-token-auth/", method: .post, parameters: parameters)
            
            /*
             Alamofire treats any completed request to be successful, regardless of the content of the response. Calling validate before a response handler causes an error to be generated if the response had an unacceptable status code or MIME type. a swift 3 read more here: https://github.com/Alamofire/Alamofire#validation
             */
            .validate()
            //here you pass a new closure to the responseString method
            .responseJSON { response in switch response.result {
                
            case .success(let data):
                
                let json = JSON(data)
                let token = json["token"].stringValue
                completionHandler(token as String!, nil)
                
            case .failure(let responseError):

                completionHandler("error" as String!, responseError)
                
            }
                
        }
    }


    open func forgotPassword(_ completionHandler: (_ responseObject: String?, _ error: NSError?) -> (), email: String?) {
        
        
        // Call to forgot password API (doesn't exist yet)
        print("forgot password for", email )

    }

    
    open func submitSurveyResponse(_ completionHandler: @escaping (_ responseObject: HTTPURLResponse?, _ error: Error?) -> (), device_id: String?, lat: String?, long: String?, response: [String:String]) {
        
        // call to submit api http://researchnet-documentation.s3-website-us-east-1.amazonaws.com/api/#survey-submission
        
        let defaults = UserDefaults.standard
        let authKey = defaults.object(forKey: "authKey")
        
        
        let parameters: Parameters = [
            "device_id" : (device_id)! as AnyObject,
            "lat" : lat! as AnyObject,
            "long" : long! as AnyObject,
            "response" : response as AnyObject
        ]
        
        
        let headers: HTTPHeaders = [
            "Authorization": "Token \(authKey!)"
        ]
        
        
        Alamofire.request("https://"+host+"/submission/",  method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseJSON { response in switch response.result {
                
            case .success(let data):
                completionHandler(response.response, nil)
                
            case .failure(let responseError):
            
                if let requestBody = response.data {
                    do {

                        let resp = response.request!.httpBody

                        let jsonArray = try JSONSerialization.jsonObject(with: resp!, options: [])
                        print("Array: \(jsonArray)")
                    }
                    catch {
                        print("Error: \(error)")
                    }
                }
                
                completionHandler(response.response, responseError)
                
                }  
            }
        }
    
    


}
