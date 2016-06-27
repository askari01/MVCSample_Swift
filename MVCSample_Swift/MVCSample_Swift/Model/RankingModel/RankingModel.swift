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
            
            // addObject Manual notification because in not KBO notification
            self.willChangeValue(forKey: "rankingAppDataEntities")
            
            for i in  (0 ..< rankingData.count) {
                
                let dict:NSDictionary = rankingData.object(at: i) as! NSDictionary
                
                let entity = AppDataEntity()
                entity.appID = dict.object(forKey: "appID") as! Int
                entity.appTitle = dict.object(forKey: "appTitle") as! String
                self.rankingAppDataEntities.append(entity)
            }
            
            self.didChangeValue(forKey: "rankingAppDataEntities")
        })
    }
}
