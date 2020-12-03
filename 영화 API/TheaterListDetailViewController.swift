//
//  TheaterListDetailViewController.swift
//  MyApps
//
//  Created by TORI on 2020/08/27.
//  Copyright © 2020 SJSJ. All rights reserved.
//

import UIKit
import MapKit

class TheaterListDetailViewController: UIViewController {
    var param: NSDictionary!
    @IBOutlet var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.param["상영관명"] as? String
        
        let lat = (param?["위도"] as! NSString).doubleValue
        let lng = (param?["경도"] as! NSString).doubleValue
        
        let location = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        let regionRadius: CLLocationDistance = 100
        let coordinateRegion = MKCoordinateRegion(center: location, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        
        self.map.setRegion(coordinateRegion, animated: true)
        
        let point = MKPointAnnotation()
        point.coordinate = location
        
        self.map.addAnnotation(point)
    }
}
