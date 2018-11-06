//
//  TableViewCell.swift
//  LifeChallenger
//
//  Created by student on 05/11/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class CellResposta: UITableViewCell {
    
    
    @IBOutlet weak var labelNivel: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var labelMaterial: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
