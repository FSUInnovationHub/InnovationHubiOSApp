//
//  SecondViewController.swift
//  InnovationHub
//
//  Created by Andres Ibarra on 1/21/18.
//  Copyright © 2018 Andres Ibarra. All rights reserved.
//

import UIKit
import Foundation
import MapKit

class AboutPage: UIViewController {

    @IBOutlet var foundingPartnersTextView: UITextView!
    @IBOutlet var academicPartnersTextView: UITextView!
    @IBOutlet var supportPartnersTextView: UITextView!
    
    @IBOutlet var goToWebsiteButton: UIButton!
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foundingPartnersTextView.layer.cornerRadius = 15
        academicPartnersTextView.layer.cornerRadius = 15
        supportPartnersTextView.layer.cornerRadius = 15
        
        
            goToWebsiteButton.layer.cornerRadius = 15
        
        
        
        mapView.showsUserLocation = true
        let location = CLLocationCoordinate2D(latitude: 30.4410997, longitude: -84.29558550000002)

        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005 )
        let region = MKCoordinateRegion(center: location, span: span)
    
        let iHubLoc = MKPlacemark(coordinate: location, addressDictionary: ["kABAddressStateKey":"FL","kABAddressCityKey":"Tallahassee","kABAddressStreetKey":"142 Collegiate Loop"])
        
        
        
        mapView.setRegion(region, animated: true)
        mapView.addAnnotation(iHubLoc)
    
        
        
    }
    
    @IBAction func goToWebsite(_ sender: UIButton) {
        
        let iHubUrl = URL(string: "https://innovation.fsu.edu")!
        UIApplication.shared.open(iHubUrl, options: [:])

        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        mapView.reloadInputViews()
    }
    
    
    

   


}

