//
//  RunViewController.swift
//  AthenaHacks
//
//  Created by Allison Reiss on 2/24/18.
//  Copyright © 2018 Allison Reiss. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
//import HDAugmentedReality


class RunViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    var locationManager : CLLocationManager!
//    var arViewController: ARViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.distanceFilter = 200
        locationManager.requestWhenInUseAuthorization()

    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.authorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let span = MKCoordinateSpanMake(0.05, 0.05)
            let region = MKCoordinateRegionMake(location.coordinate, span)
            mapView.setRegion(region, animated: false)
        }
    }

    @IBAction func showARController(_ sender: Any) {
 /*       arViewController = ARViewController()
        //set data source to provide views for visible POIs
        arViewController.dataSource = self
        //how many views are visible at once
        arViewController.maxVisibleAnnotations = 30
        arViewController.headingSmoothingFactor = 0.05
        //smoothing factor for moving views
        arViewController.setAnnotations(places)
        
        self.present(arViewController, animated: true, completion: nil) */
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
