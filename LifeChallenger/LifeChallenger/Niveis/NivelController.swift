//
//  NivelController.swift
//  LifeChallenger
//
//  Created by student on 05/11/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class NivelController: UIViewController  {

    var titulo : String?
    @IBOutlet weak var NivelTitulo: UILabel!

    override func viewDidLoad() {
        NivelTitulo.text = titulo
        super.viewDidLoad()
    }

}
