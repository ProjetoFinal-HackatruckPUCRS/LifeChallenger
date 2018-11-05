//
//  Pergunta.swift
//  LifeChallenger
//
//  Created by student on 05/11/18.
//  Copyright © 2018 student. All rights reserved.
//

import Foundation

class Pergunta {
    var pergunta: String
    var respostas: [String];
    var respostaSelecionada : String?;
    
    init (pergunta: String, respostas : [String]) {
        self.pergunta = pergunta;
        self.respostas = respostas;
    }
}
