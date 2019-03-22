//
//  ControllerAvecCarte.swift
//  Les Calanques
//
//  Created by Reginald Guerrier on 2019-03-21.
//  Copyright © 2019 Dygitar. All rights reserved.
//

import UIKit
import MapKit

class ControllerAvecCarte: UIViewController, MKMapViewDelegate {
    
    var calanques: [Calanque] = CalanqueCollection().all()

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
mapView.delegate = self
        
        addAnnotations()
    }
    
    //Mettre les annotations
    func addAnnotations()
    
    {
        for calanque in calanques
        
        {
            //Annotation de base
            /*
            let annotation = MKPointAnnotation()
            annotation.coordinate = calanque.coordonnee
            annotation.title = calanque.nom
            mapView.addAnnotation(annotation)
 */
            
            //Annotation Custom
            let annotation = MonAnnotation(calanque)
            mapView.addAnnotation(annotation)
        }
    }
    
    //Delegate
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let reuseIdentifier = "reuseID"
        
        //Vérifier que ce ne soit pas la position de l'utilisateur
        if annotation.isKind(of: MKUserLocation.self)
        
        {
            return nil
        }
        
        if let anno = annotation as? MonAnnotation
        
        {
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier)
            
            if annotationView == nil
            
            {
                annotationView = MonAnnotationView(annotation: anno, reuseIdentifier: reuseIdentifier)
                
                //annotationView?.image = UIImage(named: "placeholder")
                /////////permet de montrer une petite bulle lorsque l'on clique dessus
                //annotationView?.canShowCallout = true
                
                return annotationView
            }
            
            else
            
            {
                return annotationView
            }
        }
        
        return nil
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
