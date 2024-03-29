//
//  TableViewIntegreController.swift
//  Les Calanques
//
//  Created by Reginald Guerrier on 2019-03-21.
//  Copyright © 2019 Dygitar. All rights reserved.
//

import UIKit

let SEGUE_ID = "Detail"

class TableViewIntegreController: UITableViewController

{
    
    var calanques: [Calanque] = []
    var cellId = "CalanqueCell"

    override func viewDidLoad()
    
        {
            super.viewDidLoad()
            
            calanques = CalanqueCollection().all()
            
            tableView.backgroundColor = UIColor.clear
            let bg = UIImageView(frame: view.bounds)
            bg.image = calanques[0].image
            bg.contentMode = .scaleAspectFill
            tableView.backgroundView = bg
        }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int
    
    {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    
    {
        
        return calanques.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    
    {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellId,
                                                    for: indexPath) as? CalanqueCell
        
        {
            cell.setupCell(calanques[indexPath.row])
            
            return cell
        }
        
        else
            
        {
            //dequeueReusableCell -> C'est ce qui permet de mettre en mémoire une partie de la liste pour le scroll
            //                       lorsqu'il y a trop d'items et de supprimer ce qui n'est plus visible
            //withIdentifier -> c'est le nom de l'Identifier du cell
            let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier",
                                                     for: indexPath)
            
            let calanque = calanques[indexPath.row]
            
            cell.textLabel?.text = calanque.nom
            cell.imageView?.image = calanque.image
            
            return cell
        }
        
    
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    
    {
        return 150
    }
    

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: SEGUE_ID, sender: calanques[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SEGUE_ID
        
        {
            if let vc = segue.destination as? DetailController
            
            {
                vc.calanqueRecue = sender as? Calanque
            }
        }
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            calanques.remove(at: indexPath.row)
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            
            print ("Je pourrais éventuellement ajouter un élément")
        }    
    }
    
    
    
    
    @IBAction func reloadAction(_ sender: Any)
    
    {
        
        calanques = CalanqueCollection().all()
        tableView.reloadData()
    }
    
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
