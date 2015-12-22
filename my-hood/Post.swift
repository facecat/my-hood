//
//  Post.swift
//  my-hood
//
//  Created by 邱国邦 on 15/12/22.
//  Copyright © 2015年 FaceCat. All rights reserved.
//

import Foundation

class Post: NSObject, NSCoding {
    
    private var _title: String!
    private var _postDescription: String!
    private var _imagePath: String!
    
    var title: String {
        return _title
    }
    var postDescription: String {
        return _postDescription
    }
    var imagePath: String {
        return _imagePath
    }
    
    init(title: String, desc: String, path: String) {
        self._title = title
        self._postDescription = desc
        self._imagePath = path
    }
    
    
    //MARK: NSCoding Protocol
    override init() {
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        
        self._title =  aDecoder.decodeObjectForKey("title") as? String
        self._postDescription = aDecoder.decodeObjectForKey("description") as? String
        //#warning imagePath ?
        self._imagePath = aDecoder.decodeObjectForKey("imagePath") as? String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(_title, forKey: "title")
        aCoder.encodeObject(_postDescription, forKey: "description")
        //imagePath ?
        aCoder.encodeObject(_imagePath, forKey: "imagePath")
    }
    
    
    
    
}