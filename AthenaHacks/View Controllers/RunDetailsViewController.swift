//
//  RunDetailsViewController.swift
//  AthenaHacks
//
//  Created by Allison Reiss on 2/25/18.
//  Copyright © 2018 Allison Reiss. All rights reserved.
//

import UIKit
import MapKit

class RunDetailsViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    
    var run: Run!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()

        // Do any additional setup after loading the view.
    }
    
    private func configureView() {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
