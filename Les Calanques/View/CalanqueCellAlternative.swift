//
//  CalanqueCellAlternative.swift
//  Les Calanques
//
//  Created by Reginald Guerrier on 2019-03-21.
//  Copyright © 2019 Dygitar. All rights reserved.
//

import UIKit

class CalanqueCellAlternative: UITableViewCell

{
    
    @IBOutlet weak var ivCalanque: UIImageView!
    @IBOutlet weak var lblNom: UILabel!
    
    var calanque: Calanque?
    
    {
         didSet
         {
            if calanque != nil
            {
                ivCalanque.image = calanque!.image
                lblNom.text = calanque!.nom
            }
        }
    }
    
    override func awakeFromNib()
    
    {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
