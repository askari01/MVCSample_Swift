//
//  RankingViewController.swift
//  MVCSample_Swift
//
//  Created by inaba masaya on 2015/11/22.
//  Copyright © 2015年 inaba masaya. All rights reserved.
//

import UIKit

class RankingViewController: UIViewController, RankingTableViewDelegate {

    @IBOutlet weak var rankingTableView: RankingTableView!
   
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.rankingTableView.rankingTableViewDelegate = self
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }
    
    func didSelect() {
        print("It has been chosen")
    }
}
