//
//  Calanques.swift
//  Les Calanques
//
//  Created by Reginald Guerrier on 2019-03-21.
//  Copyright © 2019 Dygitar. All rights reserved.
//

import UIKit
import CoreLocation

class Calanque

    {
        //****************** ATTRIBUTS *****************
    
        private var _nom: String
        private var _desc: String
        private var _latitude: Double
        private var _longitude: Double
        private var _image: UIImage?
    
        //************* GETTERS SETTERS ***************
    
        var nom: String {return _nom}
        var desc: String {return _desc}
        var coordonnee: CLLocationCoordinate2D
        
            {
                return CLLocationCoordinate2D(latitude: _latitude,
                                          longitude: _longitude)
            }
        var image: UIImage? {return _image}
    
        //**************** CONSTRUCTEUR *******************
    
        init (nom: String,
              desc: String,
              image: UIImage?,
              latitude: Double,
              longitude: Double)
        
            {
                _nom = nom
                _desc = desc
                _latitude = latitude
                _longitude = longitude
                _image = image
            }
    }
