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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
        postImg.layer.cornerRadius =  postImg.frame.width / 2
    }

    
    //MARK: Action
    @IBAction func addPicBtnPressed(sender: UIButton) {
        sender.setTitle("", forState: .Normal)
        
        //do other stuff
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func addPostBtnPressed(sender: UIButton) {
        //do other things
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancelBtnPressed(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
            self.postImg.image = image
            picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
    
    
}
