//
//  ViewController.swift
//  my-hood
//
//  Created by 邱国邦 on 15/12/22.
//  Copyright © 2015年 FaceCat. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.dataSource = self
        tableview.delegate = self
        
        DataService.instance.loadPosts()
        tableview.reloadData()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "refreshTableViewContents:", name: "ntfNewPostAdded", object: nil)
    }
    
    //MARK: Function
    func refreshTableViewContents(notif: AnyObject) {
        print("Notification recieved !")
        
        DataService.instance.loadPosts()
        tableview.reloadData()
    }


    //MARK: UITableView Protocols
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        //WARNING: Why DataService.instance.posts must be retrived in these methods ?
        //Does singleton recomend that the singleton instance cannot be referenced ?
        let post = DataService.instance.posts[indexPath.row]
        if let cell = tableview.dequeueReusableCellWithIdentifier("PostCell") as? PostCell {
            cell.configureCell(post)
            return cell
        } else {
            let cell = PostCell()
            cell.configureCell(post)
            return cell
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.posts.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 78.0
    }
    
    
    
}

