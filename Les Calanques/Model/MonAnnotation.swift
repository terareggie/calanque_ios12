//
//  MonAnnotation.swift
//  Les Calanques
//
//  Created by Reginald Guerrier on 2019-03-22.
//  Copyright © 2019 Dygitar. All rights reserved.
//

import UIKit
import MapKit

class MonAnnotation: NSObject, MKAnnotation

{
    //hérite de MKAnnotation
    var coordinate: CLLocationCoordinate2D
    var title: String?
    ////////////////////
    
    var calanque: Calanque
    
    init(_ calanque: Calanque)
    
    {
    self.calanque = calanque
        coordinate = calanque.coordonnee
        title = calanque.nom
    }
    
}
