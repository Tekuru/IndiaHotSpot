//
//  DetailViewController.swift
//  IndiaHotSpot
//
//  Created by Tekuru.com on 2015/09/12.
//  Copyright (c) 2015年 Tekuru. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var aD = UIApplication.sharedApplication().delegate as! AppDelegate
        var dic = aD.placeDic
        
        imageView.image = UIImage(named: dic["Image"] as! String)
        titleLabel.text = dic["Title"] as? String
        descriptionView.text = dic["Description"] as! String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeTapped(){
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
