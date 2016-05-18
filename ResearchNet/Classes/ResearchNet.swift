import UIKit

public class ResearchNet: NSObject {

    var host: String
    var object: RFClass = RFClass()
    
    public init(host: String) {
        self.host = host
    }
    
    public func printConfiguration() {
        object.printConfiguration(self.host)
    }
    
}
