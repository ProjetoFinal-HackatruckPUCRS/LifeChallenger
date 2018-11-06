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

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "materiais", for: indexPath) as! CellResposta
        let text : String = ""
        
        cell.label.text = text
        return (cell)
    }
}
