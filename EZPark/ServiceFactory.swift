//
//  ServiceFactory.swift
//  EZPark
//
//  Created by HARPREET SINGH on 12/17/16.
//  Copyright © 2016 HARPREET SINGH. All rights reserved.
//

import UIKit

class ServiceFactory: NSObject {
  public static let sharedInstance = ServiceFactory()
    
    override init() {
    super.init()
    }
    
    func provideAPIKey() -> String {
     return "AIzaSyDAUqH59q5i0neI3MOAolYDrcpgCvPkCgA"
    }
}
