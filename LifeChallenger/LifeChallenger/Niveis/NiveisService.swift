import Foundation

class NiveisService {
    
    func nivel(pesoTotal : Int) -> String {
        var nivel = "";
        if pesoTotal < 50{
            nivel = "Básico"
        }
        else if pesoTotal < 80{
            nivel = "Intermediário"
        }
        else{
            nivel = "Avançado"
        }
        return nivel;
    }
    
}
