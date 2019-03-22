//
//  ControllerAvecTableView.swift
//  Les Calanques
//
//  Created by Reginald Guerrier on 2019-03-21.
//  Copyright © 2019 Dygitar. All rights reserved.
//

import UIKit

class ControllerAvecTableView: UIViewController,
                               UITableViewDelegate,
                               UITableViewDataSource

{
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var calanques: [Calanque] = []
    var cellId = "Alternative"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        calanques = CalanqueCollection().all()
        
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calanques.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let calanque = calanques[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellId,
                                                    for: indexPath) as? CalanqueCellAlternative
        
        {
            cell.calanque = calanque
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: SEGUE_ID, sender: calanques[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SEGUE_ID, let vc = segue.destination as? DetailController
                
            {
                vc.calanqueRecue = sender as? Calanque
            }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
