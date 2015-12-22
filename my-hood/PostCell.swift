//
//  PostCell.swift
//  my-hood
//
//  Created by 邱国邦 on 15/12/22.
//  Copyright © 2015年 FaceCat. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var DescLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        postImg.layer.cornerRadius = postImg.frame.size.width / 2
        postImg.clipsToBounds = true
    }

    func configureCell(post: Post) {
        self.titleLbl.text = post.title
        self.DescLbl.text = post.postDescription
        self.postImg.image = DataService.instance.imageForPath(post.imagePath)
    }
    
    
    
}
