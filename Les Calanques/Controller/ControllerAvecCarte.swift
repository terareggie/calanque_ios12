//
//  ControllerAvecCarte.swift
//  Les Calanques
//
//  Created by Reginald Guerrier on 2019-03-21.
//  Copyright © 2019 Dygitar. All rights reserved.
//

import UIKit
import MapKit

class ControllerAvecCarte: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    

    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    var userPosition: CLLocation?
    
    var calanques: [Calanque] = CalanqueCollection().all()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
mapView.delegate = self
        //montrer la position de l'utilisateur
        mapView.showsUserLocation = true
        
        locationManager.delegate = self
        
        //toujours demander l'autorisation
        locationManager.requestAlwaysAuthorization()
        //demander si on peut localiser notre utilisateur
        locationManager.startUpdatingLocation()//appelera le delegate
        //**** ENSUITE IL FAUT ALLER DANS LE INFO.PLIST
        //AJOUTER Privacy - Location Always and When In Use Usage
        //DANS LE STRING METTRE CE QUE L'ON VEUT QUI APPARRAISE À L'UTILISATEUR
        //AJOUTER Privacy - Location When In Use Usage Description
        //DANS LE STRING METTRE CE QUE L'ON VEUT QUI APPARRAISE À L'UTILISATEUR
        
        addAnnotations()
        
        NotificationCenter.default.addObserver(self, selector: #selector(notifDetail), name: Notification.Name("detail"), object: nil)
        
        
        if calanques.count > 0
        
        {
            let premiere = calanques[0].coordonnee
            
            setupMap(coordonnees: premiere)
        }
    }
    
    //CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.count > 0
        
        {
            if let maPosition = locations.last
            
            {
                userPosition = maPosition
            }
        }
    }
    
    func setupMap(coordonnees: CLLocationCoordinate2D)
    
    {
        //plus la valeur est grande plus on sera éloigné
        let span = MKCoordinateSpan(latitudeDelta: 0.35, longitudeDelta: 0.35)
        
        //on sera centré par rapport à la carte
        let region = MKCoordinateRegion(center: coordonnees, span: span)
        
        mapView.setRegion(region, animated: true)
    }
    
    @objc func notifDetail(notification: Notification)
    
    {
        if let calanque = notification.object as? Calanque
        
        {
            print("j'ai une calanque")
            toDetail(calanque: calanque)
        }
    }
    
    
    //permettra à une autre classe d'acceder au segue de celle ci
    func toDetail(calanque: Calanque)
    
    {
        performSegue(withIdentifier: "Detail", sender: calanque)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Detail", let controller = segue.destination as? DetailController
            
        {
            controller.calanqueRecue = sender as? Calanque
        }
        
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
                //Override
                //annotationView = MonAnnotationView(annotation: anno, reuseIdentifier: reuseIdentifier)
                
                annotationView = MonAnnotationView(controller:self,
                                                   annotation: anno,
                                                   reuseIdentifier: reuseIdentifier)
                
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
        
        if userPosition != nil
        {
            setupMap(coordonnees: userPosition!.coordinate)
        }
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
