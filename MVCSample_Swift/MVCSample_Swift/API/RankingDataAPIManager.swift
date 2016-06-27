//
//  RankingDataAPIManager.swift
//  MVCSample_Swift
//
//  Created by inaba masaya on 2015/11/22.
//  Copyright © 2015年 inaba masaya. All rights reserved.
//

import UIKit

class RankingDataAPIManager: NSObject {

    class func loadAppStoreRankingData(_ callback: ((rankingData:NSArray) -> Void)) {

        DispatchQueue.global(attributes: DispatchQueue.GlobalAttributes(rawValue: UInt64(Int(UInt64(DispatchQueueAttributes.qosBackground.rawValue))))).async(execute: {
            
            sleep(5)
            
            let dataArray:NSMutableArray = []
            let idArray:NSArray = [11111, 22222, 33333]
            let titleArray:NSArray = ["Puzzle", "Tsumutsumu", "Monsuto"]
            
            for i in 0  ..< 3 {
                let dictionary = NSMutableDictionary()
                dictionary.setObject(idArray.object(at: i), forKey:"appID")
                dictionary.setObject(titleArray.object(at: i), forKey:"appTitle")
                dataArray.add(dictionary)
            }
            
            callback(rankingData: dataArray)
        })
    }
}
