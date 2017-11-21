//
//  TimeConverter.swift
//  WhiteBoardCodingChallenges
//
//  Created by Boles on 07/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

//https://www.hackerrank.com/challenges/time-conversion
class TimeConverter: NSObject {
    
    class func convertFrom12HourTo24HourUsingStringManipulation(_ time: String) -> String {
        
        let timeComponents = time.characters.split(separator: ":").map(String.init)
        
        let secondsWithSuffix = timeComponents[2]
        
        let suffix = String(secondsWithSuffix[secondsWithSuffix.characters.index(secondsWithSuffix.endIndex, offsetBy: -2)...secondsWithSuffix.characters.index(secondsWithSuffix.endIndex, offsetBy: -1)])
        
        var hour = ""
        
        if suffix == "PM" {
            
            if timeComponents[0] == "12" {
                
                hour = timeComponents[0]
            } else {
                
                hour = String(Int(timeComponents[0])! + 12)
            }
        }
        else {
            
            if timeComponents[0] == "12" {
                
                hour = "00"
            }
            else {
                
                hour = timeComponents[0]
            }
        }
        
        let seconds = String(secondsWithSuffix[secondsWithSuffix.characters.index(secondsWithSuffix.startIndex, offsetBy: 0)...secondsWithSuffix.characters.index(secondsWithSuffix.startIndex, offsetBy: 1)])
        
        return "\(hour):\(timeComponents[1]):\(seconds)"
    }
    
    class func convertFrom12HourTo24HourUsingDateManipulation(_ time: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm:ssa"
        
        let date12 = dateFormatter.date(from: time)
        
        dateFormatter.dateFormat = "HH:mm:ss"
        let date24 = dateFormatter.string(from: date12!)
        
        return date24
    }
}
