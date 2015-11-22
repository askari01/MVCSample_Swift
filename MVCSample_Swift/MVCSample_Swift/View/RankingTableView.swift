//
//  RankingTableView.swift
//  MVCSample_Swift
//
//  Created by inaba masaya on 2015/11/22.
//  Copyright © 2015年 inaba masaya. All rights reserved.
//

import UIKit

class RankingTableView: UITableView, UITableViewDelegate, UITableViewDataSource {

    override func awakeFromNib() {
        
        self.delegate = self
        self.dataSource = self
        
        // KVO監視
        ModelLocator.sharedInstance.rankingModel.addObserver(self, forKeyPath: "rankingAppDataEntities", options: .New, context: nil)
        refreshData()
    }
    
    deinit {
        
        // KVO削除
        ModelLocator.sharedInstance.rankingModel.removeObserver(self, forKeyPath: "rankingAppDataEntities")
    }
    
    func refreshData() {
        
        ModelLocator.sharedInstance.rankingModel.loadAppStoreData()
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        
        dispatch_async(dispatch_get_main_queue(),{
            if keyPath == "rankingAppDataEntities" {
                self.reloadData()
            }
        });
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ModelLocator.sharedInstance.rankingModel.rankingAppDataEntities.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        
        let entity = ModelLocator.sharedInstance.rankingModel.rankingAppDataEntities.objectAtIndex(indexPath.row) as! AppDataEntity
        cell.textLabel?.text = entity.appTitle as String
    
        return cell
    }
    
}
