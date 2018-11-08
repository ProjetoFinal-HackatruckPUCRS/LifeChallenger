import UIKit

class NivelController: UIViewController {
    
    var titulo : String?
    var desafios: [Desafios] = []
    var desafioSelecionado  :Desafios?
    @IBOutlet weak var NivelTitulo: UILabel!
    
    override func viewDidLoad() {
        NivelTitulo.text = titulo
        desafios.append(Desafios(desafio: "Nível 1", descr: "Neste nível você irá se preparar para o decorrer dos desafios intermediários", materiais: ["Tenis de corrida","Camisa anti suor","E nosso medidor de batimento de cardíaco"]))
        desafios.append(Desafios(desafio: "Nível 2", descr: "Neste nível você estará começando algumas práticas do nível intermediário", materiais: ["Tenis de corrida","Camisa anti suor","E nosso medidor de batimento de cardíaco"]))
        desafios.append(Desafios(desafio: "Nível 3", descr: "Nível 3: agora você está 100% correndo de maneira intermdiária", materiais: ["Tenis de corrida","Camisa anti suor","E nosso medidor de batimento de cardíaco"]))
        desafios.append(Desafios(desafio: "Nível 4", descr: "Este nível é uma finalização do intermediário, o próximo já é avançado", materiais: ["Tenis de corrida","Camisa anti suor","E nosso medidor de batimento de cardíaco"]))
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? MaterialController{
            destination.materiais = desafioSelecionado?.materiais
        }
    }
}

extension NivelController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return desafios.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "desafios", for: indexPath) as! CellResposta
        let text = desafios[indexPath.row].desafio
        print(text)
        cell.label.text = text
        
        return (cell)
    }
}

extension NivelController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        desafioSelecionado = desafios[indexPath.row]
        performSegue(withIdentifier: "materialSegue", sender: nil)
    }
}
