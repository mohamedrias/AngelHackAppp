//
//  Utilities.swift
//  Screeny
//
//  Created by Alvin Varghese on 6/Dec/14.
//  Copyright (c) 2014 Effect Works. All rights reserved.
//

import UIKit
import Photos

class Utilities: NSObject {
   
    class var sharedInstance: Utilities {
        
        struct Static {
            
            static var sharedInstance: Utilities?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.sharedInstance = Utilities()
        }
        
        return Static.sharedInstance!
    }
    
    
    
    // MARK: - Getting UIViewController
    
    func getViewController(storyBoard : NSString, mainStoryBoardName : String) -> UIViewController
    {
        var mystoryBoard : UIStoryboard = UIStoryboard(name: mainStoryBoardName, bundle: nil) as UIStoryboard
        var viewControllerID : UIViewController = mystoryBoard.instantiateViewControllerWithIdentifier(storyBoard as String) as! UIViewController
        
        return viewControllerID
    }
    
    
    //MARK: AlertView Method
    
    
    func alertThis(title : NSString, message : NSString)
    {
        var alertView : UIAlertView = UIAlertView()
        alertView.delegate = self
        alertView.title = "\(title)"
        alertView.message = "\(message)"
        alertView.addButtonWithTitle("Okay")
        alertView.show()
    }
    //MARK: Converting bytes into MB
    
    func gettingTheFileSize(longLongValue : CLongLong) -> String
    {
        
        let sizeFormatter : NSByteCountFormatter = NSByteCountFormatter()
        sizeFormatter.includesUnit = true
        sizeFormatter.countStyle = NSByteCountFormatterCountStyle.File
        
        let fileSize = sizeFormatter.stringFromByteCount(llabs(longLongValue))
        return fileSize
    }
    
    
    
    func timeIntervalByDate(fromSeconds seconds : NSTimeInterval) -> NSDate
    {
        // Example -> Before 6 months -180*24*60*60
        
        var calendar : NSCalendar = NSCalendar.currentCalendar()
        calendar.timeZone = NSTimeZone.localTimeZone()
        calendar.locale = NSLocale.currentLocale()
        
        var currentDate : NSDate = NSDate()
        
        var SixMonthAgoDate : NSDate = currentDate.dateByAddingTimeInterval(seconds)
        
        
        var Last6MonthDate = calendar.components(NSCalendarUnit.CalendarUnitYear | NSCalendarUnit.CalendarUnitMonth | NSCalendarUnit.CalendarUnitDay, fromDate: SixMonthAgoDate)
        
        var LastSixMonthDate : NSDate = calendar.dateFromComponents(Last6MonthDate)!
        
        return LastSixMonthDate
    }
    
    
    func CurrentDate() -> NSDate
    {
        // Calendar
        
        var calendar : NSCalendar = NSCalendar.currentCalendar()
        calendar.timeZone = NSTimeZone.localTimeZone()
        calendar.locale = NSLocale.currentLocale()
        
        // current Date
        
        var currentDate : NSDate = NSDate()
        
        var systemCurrentDate = calendar.components(NSCalendarUnit.CalendarUnitYear | NSCalendarUnit.CalendarUnitMonth | NSCalendarUnit.CalendarUnitDay, fromDate: currentDate)
        
        var CurrentDate : NSDate = calendar.dateFromComponents(systemCurrentDate)!
        
        return CurrentDate
    }

}

















