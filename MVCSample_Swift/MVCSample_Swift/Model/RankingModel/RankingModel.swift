//
//  RankingModel.swift
//  MVCSample_Swift
//
//  Created by inaba masaya on 2015/11/22.
//  Copyright © 2015年 inaba masaya. All rights reserved.
//

import UIKit

class RankingModel: NSObject {
    
    var rankingAppDataEntities:NSMutableArray = []
    
    func loadAppStoreData() {
        
        let entity = AppDataEntity()
        entity.appID = 1
        entity.appTitle = "パズドラ"
        
        // addObjectではKBO通知されないので手動通知
        self.willChangeValueForKey("rankingAppDataEntities")
        self.rankingAppDataEntities.addObject(entity)
        self.didChangeValueForKey("rankingAppDataEntities")
        
    }

}
