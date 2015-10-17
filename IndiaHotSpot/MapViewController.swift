//
//  MapViewController.swift
//  IndiaHotSpot
//
//  Created by Tekuru.com on 2015/09/12.
//  Copyright (c) 2015年 Tekuru. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var textView: UITextView!
    var dataArray = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self

        var filePath = NSBundle.mainBundle().pathForResource("data", ofType:"plist" )
        dataArray = NSArray(contentsOfFile: filePath!)!
        
        var centerCoordinate = CLLocationCoordinate2DMake(27.1, 18.1)
        var coordinateSpan = MKCoordinateSpanMake(0.05, 0.05);
        var coordianteRegion = MKCoordinateRegionMake(centerCoordinate, coordinateSpan)
        mapView.setRegion(coordianteRegion, animated: true)
        
        var index = 0
        for dic in dataArray{
            var lattitude = dic["Lattitude"] as! Double
            var longitude = dic["Longitude"] as! Double
            
            var aCoordinate :CLLocationCoordinate2D = CLLocationCoordinate2DMake(lattitude, longitude)
            var aPlacemark = IHPlaceMark(coordinate:aCoordinate, addressDictionary:nil)
            aPlacemark.placeIndex = index
            index++
            mapView.addAnnotation(aPlacemark)
        }
    }
    
    func mapView(mapView: MKMapView!, didSelectAnnotationView view: MKAnnotationView!) {        
        
        var placemark = view.annotation as! IHPlaceMark
        var index = placemark.placeIndex
        
        var title = dataArray[index]["Title"] as! String
        var description = dataArray[index]["Description"] as! String
        
        textView.text = title + "\n" + description
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
