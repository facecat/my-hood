//
//  AddPostVC.swift
//  my-hood
//
//  Created by 邱国邦 on 15/12/22.
//  Copyright © 2015年 FaceCat. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //MARK: Property
    var imagePicker = UIImagePickerController()
   
    //MARK: Outlet
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var titleLbl: UITextField!
    @IBOutlet weak var descLbl: UITextField!
    @IBOutlet weak var addPicBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
        postImg.layer.cornerRadius =  postImg.frame.width / 2
        postImg.clipsToBounds = true
    }

    
    //MARK: Action
    @IBAction func addPicBtnPressed(sender: UIButton) {
        addPicBtn.setTitle("", forState: .Normal)
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func addPostBtnPressed(sender: UIButton) {
        if let img = postImg.image , title = titleLbl.text, desc = descLbl.text {
            
            let imgPath = DataService.instance.saveImageAndCreatPath(img)
            let addedPost = Post(title: title, desc: desc, path: imgPath)
            DataService.instance.addPost(addedPost)
            
            NSNotificationCenter.defaultCenter().postNotificationName("ntfNewPostAdded", object: nil)
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    @IBAction func cancelBtnPressed(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
            self.postImg.image = image
            picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        if postImg.image == nil {
            addPicBtn.setTitle("+ Add Pic", forState: .Normal)
        }
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
    
}
