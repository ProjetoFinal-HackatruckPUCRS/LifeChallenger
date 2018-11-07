//
//  TrilhasViewController.swift
//  LifeChallenger
//
//  Created by student on 01/11/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class TrilhasViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var questionLabel: UILabel!
    
    var trilhas : [Trilha] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.separatorStyle = .none
        tableView.separatorColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        TrilhasDAO.getInfo { (trilha) in
            self.trilhas = trilha
            self.tableView.reloadData()
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: add number of from cloudant
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return trilhas.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrilhaCell", for: indexPath) as! TrilhasTableViewCell
        
        let trilhaName = trilhas[indexPath.row].nomeTrilha
        let imgName = trilhaName + ".png"
        cell.imageTrilhas.image = UIImage(named:  imgName)
        cell.labelTrilhas.text = trilhaName
        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is OpcoesViewController{
            let vc = segue.destination as? OpcoesViewController
            let index = tableView.indexPathForSelectedRow?.row
            let trilhaParaEnviar = trilhas[index!]
            
            vc?.trilha = trilhaParaEnviar
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
