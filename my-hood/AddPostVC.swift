//
//  AddPostVC.swift
//  my-hood
//
//  Created by 邱国邦 on 15/12/22.
//  Copyright © 2015年 FaceCat. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }


    
    
    
    
    
    @IBAction func addPicBtnPressed(sender: UIButton) {
        sender.setTitle("", forState: .Normal)
        
        //do other stuff
    }
    
    @IBAction func addPostBtnPressed(sender: UIButton) {
        //do other things
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancelBtnPressed(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
