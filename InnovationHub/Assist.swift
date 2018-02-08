//
//  Assist.swift
//  InnovationHub
//
//  Created by Andres Ibarra on 1/21/18.
//  Copyright © 2018 Andres Ibarra. All rights reserved.
//

import Foundation
import UIKit




class Assist{
    
    class func convertFromHex(hexNum: Int)->UIColor{
        
        let red = CGFloat((hexNum & 0xFF0000) >> 16)/256.0
        let green = CGFloat((hexNum & 0xFF00) >> 8)/256.0
        let blue = CGFloat(hexNum & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:1.0)
        
    }
    
}
