import Foundation

class Trilha {
    
    var nomeTrilha: String
    var _rev: String
    var _id: String
    
    init(json: [String: String]) {
        self.nomeTrilha = json["trilha"] ?? ""
        self._id = json["_id"] ?? ""
        self._rev = json["_rev"] ?? ""
    }
}



class TrilhasDAO {
    
    static func getInfo (callback: @escaping (([Trilha]) -> Void)) {
        
        let endpoint: String = "https://lifechallenger.mybluemix.net/lifechallenger/trilhas"
        
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
                        
                        var count = 0
                        var trilhas : [Trilha] = []
                        while(count != json.count){
                            
                            let nova_trilha = Trilha(json: json[count])
                            
                            trilhas.append(nova_trilha)
                            
                            count = count + 1
                        }
                        callback(trilhas)
                        
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
