//
//  ControllerAvecCarte.swift
//  Les Calanques
//
//  Created by Reginald Guerrier on 2019-03-21.
//  Copyright © 2019 Dygitar. All rights reserved.
//

import UIKit
import MapKit

class ControllerAvecCarte: UIViewController {
    
    var calanques: [Calanque] = CalanqueCollection().all()

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        addAnnotations()
    }
    
    func addAnnotations()
    
    {
        for calanque in calanques
        
        {
            let annotation = MKPointAnnotation()
            annotation.coordinate = calanque.coordonnee
            annotation.title = calanque.nom
            mapView.addAnnotation(annotation)
        }
    }
    
    
    
    @IBAction func getPosition(_ sender: Any) {
    }
    
    
    
    @IBAction func segmentedChanged(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex
        
        {
        case 0: mapView.mapType = MKMapType.standard
            case 1: mapView.mapType = .satellite
            case 2: mapView.mapType = .hybrid
            default: break
        }
    }
    
    


}
