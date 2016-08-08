//
//  ResultParser.swift
//  research
//
//  Created by yesway on 16/4/29.
//  Copyright © 2016年 yesway. All rights reserved.
//

import Foundation
import ResearchKit

struct ResultParser {
    
    static func findWalkHeartFiles(result: ORKTaskResult) -> [NSURL] {
        
        var urls = [NSURL]()
        
        if let results = result.results
        where results.count > 4,
        let walkResult = results[3] as? ORKStepResult,
            let restResult = results[4] as? ORKStepResult {
            
            for wresult in walkResult.results! {
                if let wresult = wresult as? ORKFileResult,
                    let fileURl = wresult.fileURL {
                    urls.append(fileURl)
                }
            }
            
            for rresutl in restResult.results! {
                if let rresutl = rresutl as? ORKFileResult,
                    let fileURL = rresutl.fileURL {
                    urls.append(fileURL)
                }
            }
        }
     return urls
    }
    
}