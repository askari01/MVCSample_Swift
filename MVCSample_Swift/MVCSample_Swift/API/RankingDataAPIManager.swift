//
//  RankingDataAPIManager.swift
//  MVCSample_Swift
//
//  Created by inaba masaya on 2015/11/22.
//  Copyright © 2015年 inaba masaya. All rights reserved.
//

import UIKit

class RankingDataAPIManager: NSObject {

    class func loadAppStoreRankingData(callback: ((rankingData:NSArray) -> Void)) {

        dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), {
            
            sleep(5)
            
            let dataArray:NSMutableArray = []
            let idArray:NSArray = [11111, 22222, 33333]
            let titleArray:NSArray = ["パズドラ", "ツムツム", "モンスト"]
            
            for var i = 0 ; i < 3 ; i++ {
                let dictionary = NSMutableDictionary()
                dictionary.setObject(idArray.objectAtIndex(i), forKey:"appID")
                dictionary.setObject(titleArray.objectAtIndex(i), forKey:"appTitle")
                dataArray.addObject(dictionary)
            }
            
            callback(rankingData: dataArray)
        })
    }
}
