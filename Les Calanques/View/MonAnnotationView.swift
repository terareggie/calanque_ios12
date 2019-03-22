//
//  MonAnnotationView.swift
//  Les Calanques
//
//  Created by Reginald Guerrier on 2019-03-22.
//  Copyright © 2019 Dygitar. All rights reserved.
//

import UIKit
import MapKit

class MonAnnotationView: MKAnnotationView {

    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        
        setupAnnotation()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupAnnotation()
    }
    
    func setupAnnotation()
    
    {
        image = UIImage(named: "placeholder")
        //permet de montrer une petite bulle lorsque l'on clique dessus
        canShowCallout = true
        
        leftCalloutAccessoryView = setupLeft()
        rightCalloutAccessoryView = setupRight()
        detailCalloutAccessoryView = setupCenter()
    }
    
    func setupLeft() -> UIButton
    
    {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        
        button.setImage(UIImage(named: "distance"), for: .normal)
        
        //Ajouter une action au bouton
        //il faudra ajouter une fonction gps comme ceci puisque c'est un selector (@objc func gps())
        button.addTarget(self, action: #selector(gps), for: .touchUpInside)
        
        return button
    }
    
    func setupRight() -> UIButton
        
    {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        
        button.setImage(UIImage(named: "detail"), for: .normal)
        
        //Ajouter une action au bouton
        //il faudra ajouter une fonction detail comme ceci puisque c'est un selector (@objc func detail())
        button.addTarget(self, action: #selector(detail), for: .touchUpInside)
        
        return button
    }
    
    func setupCenter() -> UIView?
        
    {
        guard let anno = annotation as? MonAnnotation else {return nil}
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 125, height: 125))
        
        
        
        //Ajouter des contraintes pour que la view puisse apparaitre
       view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 125).isActive = true
        view.heightAnchor.constraint(equalToConstant: 125).isActive = true
        
        let imageView = UIImageView(frame: view.bounds)
        imageView.image = anno.calanque.image
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        view.addSubview(imageView)
        
        return view
    }
    
    //puisque c'est un selector il faut ajouter @objc
    @objc func detail()
    
    {
    
    }
    
    //puisque c'est un selector il faut ajouter @objc
    @objc func gps()
        
    {
        
    }
}
