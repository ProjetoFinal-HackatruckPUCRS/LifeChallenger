//
//  OpcaoTableViewCell.swift
//  LifeChallenger
//
//  Created by student on 06/11/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class OpcaoTableViewCell: UITableViewCell {

    @IBOutlet weak var opcao: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
