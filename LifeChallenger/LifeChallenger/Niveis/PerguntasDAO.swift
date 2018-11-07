//
//  PerguntasDAO.swift
//  LifeChallenger
//
//  Created by student on 06/11/18.
//  Copyright © 2018 student. All rights reserved.
//
import Foundation


class PerguntasDAO {
    
    static func getInfo (callback: @escaping (([Pergunta]) -> Void), opcao : String) {
        
        let endpoint: String = "https://lifechallenger.mybluemix.net/lifechallenger/opcoes/" + opcao
        
        guard let url = URL(string: endpoint) else {
            print("Error: Cannot create URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            
            if error != nil {
                print("Error = \(String(describing: error))")
                return
            }
            
            let responseString = String(data: data!, encoding: String.Encoding.utf8)
            print("responseString = \(String(describing: responseString))")
            
            DispatchQueue.main.async() {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [[String: AnyObject]] {
                        
                       
                        var count = 0
                        var perguntas : [Pergunta] = []
                        while(count != json.count){
                            
                            let nova_pergunta = Pergunta(json: json[count])
                            
                            perguntas.append(nova_pergunta)
                            
                            count = count + 1
                        }
                        
                        callback(perguntas)
                        
                    }else {
                        
                        print("Error")
                    }
                } catch let error as NSError {
                    print("Error = \(error.localizedDescription)")
                }
            }
            
            
        })
        
        task.resume()
    }
}
