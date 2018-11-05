import Foundation

class NiveisService {
    
    func nivel(pesoTotal : Int) -> String {
        var nivel = "";
        if pesoTotal < 20{
            nivel = "Básico"
        }
        else if pesoTotal < 40{
            nivel = "Intermediário"
        }
        else{
            nivel = "Avançado"
        }
        return nivel;
    }
    
}
