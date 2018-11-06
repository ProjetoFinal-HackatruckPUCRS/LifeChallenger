//
//  OpcoesViewController.swift
//  LifeChallenger
//
//  Created by student on 01/11/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class OpcoesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tipoTrilha: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    var trilha : Trilha?
    
    var opcoes : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipoTrilha.text = trilha?.nomeTrilha
        
        
        OpcoesDAO.getInfo(callback: { (opcoes) in
            self.opcoes = opcoes
            print(opcoes)
            self.tableView.reloadData()
        }, categoria: (trilha?.nomeTrilha)!)

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return opcoes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "option", for: indexPath) as! OpcaoTableViewCell
        
        let opcao = opcoes[indexPath.row]

        cell.opcao.text = opcao
        return cell
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


