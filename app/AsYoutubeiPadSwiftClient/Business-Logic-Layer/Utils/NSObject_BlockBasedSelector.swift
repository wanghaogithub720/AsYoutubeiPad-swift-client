//
//  NSObject_BlockBasedSelector.swift
//  Swift_NSObject_BlockBasedSelector
//
//  Created by Jack Rostron on 10/06/2014.
//  Copyright (c) 2014 Jack Rostron. All rights reserved.
//

import UIKit

extension NSObject {
    
    func performClosureAfterDelay(delay: Int, block:() -> Void) {
        let delay64 = Int64(delay)
        let nano64 = Int64(NSEC_PER_SEC)
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay64 * nano64))
        
        dispatch_after(delayTime, dispatch_get_main_queue(), block)
    }
    
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   