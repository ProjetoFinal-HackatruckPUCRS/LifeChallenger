//
//  OpcoesViewController.swift
//  LifeChallenger
//
//  Created by student on 01/11/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class OpcoesViewController: UIViewController, UITableViewDataSource {

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
}

extension OpcoesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "funcionalidadeSegue", sender: nil)
    }
}


