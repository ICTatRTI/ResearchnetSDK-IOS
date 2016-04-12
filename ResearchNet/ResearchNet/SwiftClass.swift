//
//  SwiftClass.swift
//  ResearchNet
//
//  Created by Adam Preston on 4/12/16.
//  Copyright © 2016 RTI. All rights reserved.
//

import UIKit

public class SwiftClass: NSObject {

    var message: String
    var object: RFClass = RFClass()
    
    public init(_ newMessage: String) {
        self.message = newMessage
    }
    
    public func printMessage() {
        object.printMessage(self.message)
    }
    
}
