//
//  BoutonArrondi.swift
//  Les Calanques
//
//  Created by Reginald Guerrier on 2019-03-21.
//  Copyright © 2019 Dygitar. All rights reserved.
//

import UIKit

class BoutonArrondi: UIButton {

    override init(frame: CGRect)
        
    {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
        
    {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    func setup()
        
    {
        layer.cornerRadius = 10
        
    }

}
