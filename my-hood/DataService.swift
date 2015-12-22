//
//  DataService.swift
//  my-hood
//
//  Created by 邱国邦 on 15/12/22.
//  Copyright © 2015年 FaceCat. All rights reserved.
//

import Foundation
import UIKit

class DataService {
    
    //WARNING: A DataService instance created in "THIS class SELF", which makes a "singleton"? Am I right?
    static let instance = DataService()
    
    var _posts = [Post]()
    
    var posts: [Post] {
        return _posts
    }

    let POSTS_KEY = "posts"

    func savePosts() {
        //Before setObject forKey ,turn to NSData first.
        let postsData = NSKeyedArchiver.archivedDataWithRootObject(_posts)
        NSUserDefaults.standardUserDefaults().setObject(postsData, forKey: POSTS_KEY)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func loadPosts() {
        if let postsData = NSUserDefaults.standardUserDefaults().objectForKey(POSTS_KEY) as? NSData {

            if let postsArray = NSKeyedUnarchiver.unarchiveObjectWithData(postsData) as? [Post] {
                 _posts = postsArray
            }
        }
        print("\(_posts.count)")
    }
    
    func addPost(post: Post) {
        _posts.append(post)
        
        savePosts()
        loadPosts()
    }
    
    func saveImageAndCreatPath(img: UIImage) ->String {
        let imageData = UIImagePNGRepresentation(img)
        let imagePath = "image\(NSDate.timeIntervalSinceReferenceDate()).png"
        let fullPath = documentsPathsForFileName(imagePath)
        imageData?.writeToFile(fullPath, atomically: true)
//        if imageData != nil { print("ok")}
        return imagePath
    }
    
    func imageForPath(path: String) ->UIImage? {
        let fullPath = documentsPathsForFileName(path)
        let img = UIImage(named: fullPath)
        return img
    }
    
    private func documentsPathsForFileName(name: String) ->String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let fullPath = paths[0] as NSString
        return fullPath.stringByAppendingPathComponent(name)
    }
    
}
