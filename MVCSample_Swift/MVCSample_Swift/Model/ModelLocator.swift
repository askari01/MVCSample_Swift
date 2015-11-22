//
//  ModelLocator.swift
//  MVCSample_Swift
//
//  Created by inaba masaya on 2015/11/22.
//  Copyright © 2015年 inaba masaya. All rights reserved.
//

import UIKit

class ModelLocator: NSObject {
    
    let rankingModel:RankingModel
    
    static let sharedInstance = ModelLocator()
    
    override init() {
        self.rankingModel = RankingModel()
    }

}
