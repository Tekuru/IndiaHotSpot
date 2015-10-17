//
//  ViewController.swift
//  IndiaHotSpot
//
//  Created by Tekuru.com on 2015/08/22.
//  Copyright (c) 2015年 Tekuru. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var cView: UICollectionView!
    var dataArray = []
    var filteredArray = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var filePath = NSBundle.mainBundle().pathForResource("data", ofType:"plist" )
        dataArray = NSArray(contentsOfFile: filePath!)!
        filteredArray = dataArray.copy() as! NSArray
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! UICollectionViewCell
        
        var imageView = cell.viewWithTag(1) as! UIImageView
        var imageName = filteredArray[indexPath.row]["Image"] as! String
        imageView.image = UIImage(named: imageName)
        
        var title = cell.viewWithTag(2) as! UILabel
        var titleString = filteredArray[indexPath.row]["Title"] as! String
        title.text = titleString
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        var aD = UIApplication.sharedApplication().delegate as! AppDelegate
        aD.placeDic = filteredArray[indexPath.row] as! NSDictionary
        
        self.performSegueWithIdentifier("ToDetail", sender: self)
    }
    
    @IBAction func placeChanged(sender: UISegmentedControl){
        filter("Place", segment: sender)
    }
    
    @IBAction func categoryChanged(sender: UISegmentedControl){
        filter("Category", segment: sender)
    }

    
    func filter(key :String, segment: UISegmentedControl){
        var tempArray:NSMutableArray = []
        if segment.selectedSegmentIndex == 0{
            tempArray = dataArray.copy() as! NSMutableArray
        }else{
            for dic in dataArray{
                var place = dic[key] as! String
                if place == segment.titleForSegmentAtIndex(segment.selectedSegmentIndex){
                    tempArray.addObject(dic)
                }
            }
        }
        filteredArray = tempArray
        cView .reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

