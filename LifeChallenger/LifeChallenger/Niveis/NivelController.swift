//
//  NivelController.swift
//  LifeChallenger
//
//  Created by student on 05/11/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class NivelController: UIViewController, UITableViewDataSource {
    
    
    var desafios: [String] = []
    var titulo : String?
    @IBOutlet weak var NivelTitulo: UILabel!

    override func viewDidLoad() {
        NivelTitulo.text = titulo
        desafios.append("Desafio 1")
        desafios.append("Desafio 2")
        desafios.append("Desafio 3")
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return desafios.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "desafios", for: indexPath) as! CellResposta
        let text = desafios[indexPath.row]
        print(text)
        cell.labelNivel.text = text
        
        return (cell)
    }

}
