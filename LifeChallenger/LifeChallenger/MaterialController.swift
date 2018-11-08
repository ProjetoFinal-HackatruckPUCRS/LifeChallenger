//
//  MaterialController.swift
//  LifeChallenger
//
//  Created by student on 05/11/18.
//  Copyright © 2018 student. All rights reserved.
//

import Foundation
import UIKit

//precisamos que ao seleionar o nivel (tem um array na outra classe de nivel) aqui apareça lista de materiais correspondente

class MaterialController : UIViewController, UITableViewDataSource {
    
    var materiais = ["Tenis de corrida","Camisa antitranspirante","Nosso medidor de batimento de cardíaco"]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return materiais.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "materiais", for: indexPath) as! CellResposta
        let text : String = materiais[indexPath.row]
        print(text)
        cell.labelMaterial.text = text
        return (cell)
    }
}
