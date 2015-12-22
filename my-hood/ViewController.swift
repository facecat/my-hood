//
//  ViewController.swift
//  my-hood
//
//  Created by 邱国邦 on 15/12/22.
//  Copyright © 2015年 FaceCat. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var posts = [Post]()
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.dataSource = self
        tableview.delegate = self
        
        //fake data
        let post1 = Post(title: "wathoh sdawdadasd", desc: "sadasd w WDADASDAWDADASDAWDADSAD", path: "")
        let post2 = Post(title: "huhw jiaw dia jao ", desc: "DWj jiw idjaidWDi jiwajDWD ", path: "")
        posts.append(post1)
        posts.append(post2)
        tableview.reloadData()
    }


    //MARK: UITableView Protocols
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableview.dequeueReusableCellWithIdentifier("PostCell") as? PostCell {
            cell.configureCell(posts[indexPath.row])
            return cell
        } else {
            let cell = PostCell()
            cell.configureCell(posts[indexPath.row])
            return cell
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    
    
    
}

