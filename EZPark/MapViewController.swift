//
//  MapViewController.swift
//  EZPark
//
//  Created by HARPREET SINGH on 12/17/16.
//  Copyright © 2016 HARPREET SINGH. All rights reserved.
//

import UIKit
import GoogleMaps


class MapViewController: UIViewController, CLLocationManagerDelegate {
    var mapView:GMSMapView?
    var locationManager = CLLocationManager()
    var didFindMyLocation = false

    @IBOutlet weak var locationButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpView()
    }
    
    func setUpView() {
        //Camera
        let camera = GMSCameraPosition.camera(withLatitude: 38.9339, longitude: -77.1773, zoom: 15.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        guard let mapView = mapView else {
        return
        }
        mapView.isMyLocationEnabled = true
        
        view = mapView
        mapView.addSubview(locationButton)
        
        //locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 38.9339, longitude: -77.1773)
        marker.title = "McLean, VA"
        marker.snippet = "USA"
        marker.map = mapView
    }

    @IBAction func locationButtonTap(_ sender: UIButton) {
        print("Location Button Tapped")
        if (CLLocationManager.locationServicesEnabled())
        {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
            
            guard let mapView = mapView else {
                return
            }
//            mapView.showsUserLocation = true
        }
        
//        let myAnnotation: MKPointAnnotation = MKPointAnnotation()
//        myAnnotation.coordinate = CLLocationCoordinate2DMake(userLocation.coordinate.latitude, userLocation.coordinate.longitude);
//        myAnnotation.title = "Current location"
//        mapView.addAnnotation(myAnnotation)
        
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
