//
//  ViewController.swift
//  research
//
//  Created by yesway on 16/4/29.
//  Copyright © 2016年 yesway. All rights reserved.
//

import UIKit
import ResearchKit

class ViewController: UIViewController,ORKTaskViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func authorizeapped() {
        HealthkitManager.authorizeHealthKit()
    }
    @IBAction func walkTapped() {
        let taskViewController = ORKTaskViewController(task: WalkTask,taskRunUUID:nil)
        taskViewController.delegate = self
        
        taskViewController.outputDirectory = NSURL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0], isDirectory: true)
        
        presentViewController(taskViewController, animated: true, completion: nil)
        
        HealthkitManager.startMockHeartData()
        
    }
    
    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
        
        HealthkitManager.stopMockHeartData()
        
        if (taskViewController.task?.identifier == "WalkTask" && reason == .Completed) {
            let heartURLs = ResultParser.findWalkHeartFiles(taskViewController.result)
            
            for url in heartURLs {
                do {
                    let string = try NSString.init(contentsOfURL: url, encoding: NSUTF8StringEncoding)
                    print(string)
                } catch {}
            }
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }


}

