//
//  Desafios.swift
//  LifeChallenger
//
//  Created by student on 06/11/18.
//  Copyright © 2018 student. All rights reserved.
//

import Foundation

class Desafios {
    var desafio: String
    var descricao: String
    var materiais: [String]
    
    init (desafio: String, descr: String, materiais: [String]) {
        self.desafio = desafio
        self.descricao = descr
        self.materiais = materiais
    }
}
