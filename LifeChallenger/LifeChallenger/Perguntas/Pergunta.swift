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
    var respostas: [Resposta]
    var respostaSelecionada : String
    var _id : String
    var _rev : String
    
    //    init (pergunta: String, respostas : [Resposta]) {
    //        self.pergunta = pergunta;
    //        self.respostas = respostas;
    //    }
    
    init(json: [String: AnyObject
        ]) {
        self.pergunta = (json["pergunta"] as? String)! 
        self._id = json["_id"] as! String 
        self._rev = (json["_rev"] as? String)! 
        self.respostaSelecionada = ""
        
        
        var cont = 1
        var opcao = "opcao" + String(cont)
        var peso = "peso" + String(cont)
        var json_resp : [Resposta] = []
        while json[opcao] != nil {
          
            json_resp.append(Resposta(resposta: json[opcao] as! String, peso: json[peso] as! Int))
            cont = cont + 1
            opcao = "opcao" + String(cont)
            peso = "peso" + String(cont)
        }
        
        respostas = json_resp
        
    }
}

