//
//  PerguntasController.swift
//  LifeChallenger
//
//  Created by student on 01/11/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class PerguntasController: UIViewController, UITableViewDataSource {
    
    var respostas : [Resposta] = []
    var perguntas : [Pergunta] = [];
    var perguntaAtual: Pergunta?;
    var indexPergunta: Int = 0;
    
    override func viewDidLoad() {
        respostas.append(Resposta(resposta:"Sim", peso: 5))
                         
        perguntas.append(Pergunta(pergunta: "Você já corre?", respostas: respostas))
        
        self.perguntaAtual = perguntas[0];
        
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // if ultima pergunta vai pra proxima tela
        // else carrega nova pergunta
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let pergunta = perguntaAtual{
            return pergunta.respostas.count;
        }
        return 0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resposta", for: indexPath) as! CellResposta
        
        if let pergunta = perguntaAtual{
            let resposta = pergunta.respostas[indexPath.row];
            
            cell.label.text = resposta.resposta
        }
        
        return (cell)
    }
}

extension PerguntasController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let pergunta = perguntaAtual{
            let resposta = pergunta.respostas[indexPath.row]
            self.indexPergunta += 1
            
            let perguntasRestantes = (perguntas.count - 1) - indexPergunta
            let temNovaPergunta =  perguntasRestantes != 0
            
            if temNovaPergunta{
                perguntaAtual = perguntas[indexPergunta]
                tableView.reloadData()
            }
            else{
                
            }
        }
    }
        
}
