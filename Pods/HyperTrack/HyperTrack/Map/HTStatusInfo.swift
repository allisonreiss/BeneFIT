//
//  HTStatusInfo.swift
//  Pods
//
//  Created by ravi on 9/7/17.
//
//

import UIKit

@objc public class HTStatusInfo: NSObject {
    /**
    Username of user to whom the action is assigned
     */
    public var userName: String = ""
    
    /**
    Date at which action was updated
     */
    public var lastUpdated: Date = Date()
    
    /**
    Speed of the user to whom the action is assigned
    */
    public var speed: Int?
    
    /**
    Battery of user
    */
    public var battery: Int?
    
    /**
    Url of the user's photo
    */
   public var photoUrl: URL?
    
    /**
    eta of user for completing the action
    */
    public var etaMinutes: Double? = nil
    
    /**
    distance unit used while giving distance info
     */
    public var distanceUnit = "mi"
    
    /**
    distance left for completing the action, it is given in the distance unit which is decided based on user's location
    */
    public var distanceLeft: Double?
    
    /**
     distance covered while completing the action, it is given in the distance unit which is decided based on user's location
     */
    public var distanceCovered: Double = 0.0
    
    /**
     Human readable status for the action
    */
    public var status: String = ""
    
    /**
    time elapsed while completing the action
    */
    public var timeElapsedMinutes: Double = 0
    
    /**
    address where the action is started
    */
    public var startAddress: String?
    
    /**
     address where the action is completed
     */
    public var completeAddress: String?
    
    /**
     time when the action is started
     */
    public var startTime: Date?

    /**
     time when the action is ended
     */
    public var endTime: Date?
    
    /**
     display fields of action
     */
    public var display: HyperTrackActionDisplay?
    
    /**
     specifies wether you can show details of action 
    */
    public var showActionDetailSummary = false
    
    public func getDistanceLeft() -> NSNumber?{
        if let distanceLeft = self.distanceLeft{
            return NSNumber(value: distanceLeft)
        }
        return nil
    }
}
