//
//  LastViewController.swift
//  CarAlarm
//
//  Created by Володимир Височанський on 11.04.2021.
//

import CoreLocation
import MapKit
import UIKit

class LastViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet var mapView: MKMapView!
    
    let manager = CLLocationManager()
    
    @IBOutlet weak var homeButton: UIButton!
    
    @IBOutlet weak var cameraButton: UIButton!
    
    @IBOutlet weak var microButton: UIButton!
    
    @IBOutlet weak var lastButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setUpElements()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first{
            manager.stopUpdatingLocation()
            
            render(location)
        }
    }
    
    func render(_ location: CLLocation) {
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)

        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)

        let region = MKCoordinateRegion(center: coordinate, span: span)

        mapView.setRegion(region, animated: true)

        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        mapView.addAnnotation(pin)
    }
    
    
    func setUpElements() {
        
        // Hide the error label

        
        // Style the elements

        Utilities.styleFilledButton1(homeButton)
        Utilities.styleFilledButton1(cameraButton)
        Utilities.styleFilledButton1(microButton)
        Utilities.styleFilledButton1(lastButton)
        
    }
    
    @IBAction func homeTapped(_ sender: Any) {
        let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        self.view.window?.rootViewController = homeViewController
        self.view.window?.makeKeyAndVisible()
    }
    
    
    @IBAction func cameraTapped(_ sender: Any) {
        let cameraViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.cameraViewController) as? CameraViewController
        
        self.view.window?.rootViewController = cameraViewController
        self.view.window?.makeKeyAndVisible()
    }
    
    
    @IBAction func microTapped(_ sender: Any) {
        let microViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.microViewController) as? MicroViewController
        
        self.view.window?.rootViewController = microViewController
        self.view.window?.makeKeyAndVisible()
    }
    
    
}
