//
//  RankingTableView.swift
//  MVCSample_Swift
//
//  Created by inaba masaya on 2015/11/22.
//  Copyright © 2015年 inaba masaya. All rights reserved.
//

import UIKit

protocol RankingTableViewDelegate {
    func didSelect()
}

class RankingTableView: UITableView, UITableViewDelegate, UITableViewDataSource {

    var rankingTableViewDelegate: RankingTableViewDelegate?
    
    override func awakeFromNib() {
        
        self.delegate = self
        self.dataSource = self
        
        // KVO Monitoring
        ModelLocator.sharedInstance.rankingModel.addObserver(self, forKeyPath: "rankingAppDataEntities", options: .new, context: nil)
        refreshData()
    }
    
    deinit {
        
        // KVO Delete
        ModelLocator.sharedInstance.rankingModel.removeObserver(self, forKeyPath: "rankingAppDataEntities")
    }
    
    func refreshData() {
        
        ModelLocator.sharedInstance.rankingModel.loadAppStoreData()
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: AnyObject?, change: [NSKeyValueChangeKey : AnyObject]?, context: UnsafeMutablePointer<Void>?) {
        
        DispatchQueue.main.async(execute: {
            if keyPath == "rankingAppDataEntities" {
                self.reloadData()
            }
        });
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        rankingTableViewDelegate?.didSelect()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ModelLocator.sharedInstance.rankingModel.rankingAppDataEntities.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        
        let entity = ModelLocator.sharedInstance.rankingModel.rankingAppDataEntities[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = entity.appTitle as String
    
        return cell
    }
    
}
