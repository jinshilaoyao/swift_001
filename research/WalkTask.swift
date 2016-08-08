//
//  WalkTask.swift
//  research
//
//  Created by yesway on 16/4/29.
//  Copyright © 2016年 yesway. All rights reserved.
//
import ResearchKit

public var WalkTask: ORKOrderedTask {

    return ORKOrderedTask.fitnessCheckTaskWithIdentifier("WalkTask", intendedUseDescription: nil, walkDuration: 15 as NSTimeInterval, restDuration: 15 as NSTimeInterval, options: .None)

}
