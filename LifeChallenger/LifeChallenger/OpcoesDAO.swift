//
//  OpcoesDAO.swift
//  LifeChallenger
//
//  Created by student on 06/11/18.
//  Copyright © 2018 student. All rights reserved.
//

import Foundation


class OpcoesDAO {
    
    static func getInfo (callback: @escaping (([String]) -> Void), categoria : String) {
        
        let endpoint: String = "https://lifechallenger.mybluemix.net/lifechallenger/opcoes/categoria?query=categoria:" + categoria
        
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
                    if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [[String: String]] {
                        
                        var opcoes : [String] = []
                        var count = 1
                        var option = "option" + String(count)
                        while(json[0][option] != nil){
                            
                            let nova_opcao = json[0][option]
                            opcoes.append(nova_opcao!)
                            
                            count = count + 1
                            option = "option" + String(count)
                        }
                        
                        callback(opcoes)
                        
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
