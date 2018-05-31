//
//  InfoViewController.swift
//  LaFonderie
//
//  Created by BRAET Sergio (s) on 31/05/2018.
//  Copyright © 2018 BRAET Sergio (s). All rights reserved.
//

import UIKit
import MapKit

class InfoViewController: UIViewController, MKMapViewDelegate {
    var locationManager = CLLocationManager()
    @IBOutlet var mijnMapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ""
locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        let annotation = MKPointAnnotation()
        annotation.title = "La Fonderie"
        annotation.coordinate = CLLocationCoordinate2D(latitude: 50.852502, longitude: 4.335923)
        self.mijnMapView.addAnnotation(annotation)
        self.mijnMapView.showAnnotations(self.mijnMapView.annotations, animated: true)
        
        // Do any additional setup after loading the view.
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
