//
//  HealthKitManager.swift
//  research
//
//  Created by yesway on 16/4/29.
//  Copyright © 2016年 yesway. All rights reserved.
//

import Foundation
import HealthKitUI

class HealthkitManager: NSObject {
    
    static let healthKitStore = HKHealthStore()
    
    static var timer: NSTimer?
    
    
    static func startMockHeartData() {
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(HealthkitManager.saveMockHeartData), userInfo: nil, repeats: true)
        
    }
    
    static func stopMockHeartData() {
        self.timer?.invalidate()
    }
    
    static func authorizeHealthKit() {
        
        let healthKitType: Set = [HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierHeartRate)!,HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierDistanceWalkingRunning)!]
        
        
        healthKitStore.requestAuthorizationToShareTypes(healthKitType, readTypes: healthKitType) {_,_ in }
    }
    
    static func saveMockHeartData() {
        
        let heartRateType = HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierHeartRate)!
        
        let heartRateQuantity = HKQuantity(unit: HKUnit(fromString:"count/min"), doubleValue: Double(arc4random_uniform(80) + 100))
        

        let heartSample = HKQuantitySample(type: heartRateType, quantity: heartRateQuantity, startDate: NSDate(), endDate: NSDate())
        
        healthKitStore.saveObject(heartSample) { (success, error) in
            
            if let error = error {
                print("error = \(error)")
            }
        }
    }
    
    
    
    
    
    
}