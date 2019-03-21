//
//  CalanqueCell.swift
//  Les Calanques
//
//  Created by Reginald Guerrier on 2019-03-21.
//  Copyright © 2019 Dygitar. All rights reserved.
//

import UIKit

class CalanqueCell: UITableViewCell

{
    
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imgvCalanque: ImageRonde!
    @IBOutlet weak var lblNom: UILabel!
    
    var calanque: Calanque!
    
    override func awakeFromNib()
    
    {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    
    {
        super.setSelected(selected, animated: animated)

       
    }
    
    func setupCell (_ calanque: Calanque)
    
        {
            self.backgroundColor = UIColor.clear
            
            self.calanque = calanque
            containerView.layer.cornerRadius = 20
            containerView.backgroundColor = UIColor.lightGray
            lblNom.text = self.calanque.nom
            imgvCalanque.image = self.calanque.image
            
        }

}
