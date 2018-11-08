//
//  SensorDAO.swift
//  LifeChallenger
//
//  Created by student on 07/11/18.
//  Copyright © 2018 student. All rights reserved.
//

import Foundation

class SensorBMP {
    var batimento: Double
    var _rev: String
    var _id: String
    
    init(json: [String: AnyObject]) {
        self.batimento = json["batimento"] as? Double ?? 0.0
        self._id = json["_id"] as? String ?? ""
        self._rev = json["_rev"] as? String ?? ""
    }
}



class SensorDAO {
    
    static func getInfo (callback: @escaping ((SensorBMP) -> Void)) {
        
        let endpoint: String = "https://lifechallenger.mybluemix.net/lifechallenger/batimento"
        
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
                        
                        
                        let batimento = SensorBMP(json: json[0])
                    
                        callback(batimento)
                        
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



