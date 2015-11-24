//
//  RankingModel.swift
//  MVCSample_Swift
//
//  Created by inaba masaya on 2015/11/22.
//  Copyright © 2015年 inaba masaya. All rights reserved.
//

import UIKit

class RankingModel: NSObject {
    
    var rankingAppDataEntities:[AppDataEntity] = []
    
    func loadAppStoreData() {

        RankingDataAPIManager.loadAppStoreRankingData({ (rankingData:NSArray) in
            
            // addObjectではKBO通知されないので手動通知
            self.willChangeValueForKey("rankingAppDataEntities")
            
            for var i = 0 ; i < rankingData.count ; i++ {
                
                let dict:NSDictionary = rankingData.objectAtIndex(i) as! NSDictionary
                
                let entity = AppDataEntity()
                entity.appID = dict.objectForKey("appID") as! Int
                entity.appTitle = dict.objectForKey("appTitle") as! String
                self.rankingAppDataEntities.append(entity)
            }
            
            self.didChangeValueForKey("rankingAppDataEntities")
        })
    }
}
